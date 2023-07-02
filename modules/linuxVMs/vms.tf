
data "azurerm_key_vault" "key_vault" {
  name                = var.key_vault_name
  resource_group_name = var.rg_shared
}

data "azurerm_key_vault_secret" "admin_username" {
  name         = "admin-username"
  key_vault_id = data.azurerm_key_vault.key_vault.id
}

data "azurerm_key_vault_secret" "admin_password" {
  name         = "admin-password"
  key_vault_id = data.azurerm_key_vault.key_vault.id
}

resource "azurerm_linux_virtual_machine" "linux_VMs" {
  for_each            = var.vm_names
  name                = each.key
  resource_group_name = var.rg_workspace
  location            = var.location
  size                = each.value["machine_size"]

  network_interface_ids = [
    azurerm_network_interface.network_interface[each.key].id,
  ]

  admin_username                  = data.azurerm_key_vault_secret.admin_username.value
  admin_password                  = data.azurerm_key_vault_secret.admin_password.value
  disable_password_authentication = false

  os_disk {
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }

  source_image_reference {
    publisher = each.value["publisher"]
    offer     = each.value["offer"]
    sku       = each.value["sku"]
    version   = each.value["version"]
  }

  plan {
    publisher = each.value["publisher"]
    product   = each.value["offer"]
    name      = each.value["sku"]
  }

  identity {
    type = "SystemAssigned"
  }

  tags = merge(
    var.tags,
    {
      NAME               = each.key
      RESOURCE           = "azurerm_linux_virtual_machine",
      AUTOSCHEDULE_LINUX = each.value["auto_schedule"]
    },
  )
}

resource "azurerm_managed_disk" "manged_disk" {
  for_each             = var.vm_names
  name                 = "${each.key}-disk1"
  location             = var.location
  resource_group_name  = var.rg_workspace
  storage_account_type = each.value["disk_type"]
  create_option        = "Empty"
  disk_size_gb         = each.value["disk_size_gb"]
}

resource "azurerm_virtual_machine_data_disk_attachment" "disk_attach" {
  for_each           = var.vm_names
  managed_disk_id    = azurerm_managed_disk.manged_disk[each.key].id
  virtual_machine_id = azurerm_linux_virtual_machine.linux_VMs[each.key].id
  lun                = "10"
  caching            = "ReadWrite"
}
