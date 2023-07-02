# Reference Azure Key Vault
data "azurerm_key_vault" "key_vault" {
  name                = var.key_vault_name
  resource_group_name = var.rg_shared
}

# Reference Key Vault Secret
data "azurerm_key_vault_secret" "admin_username" {
  name         = "admin-username"
  key_vault_id = data.azurerm_key_vault.key_vault.id
}

data "azurerm_key_vault_secret" "admin_password" {
  name         = "admin-password"
  key_vault_id = data.azurerm_key_vault.key_vault.id
}


resource "azurerm_windows_virtual_machine" "windows_VMs" {
  for_each            = var.vm_names
  name                = each.key
  resource_group_name = var.rg_workspace
  location            = var.location
  size                = each.value["machine_size"]

  admin_username = data.azurerm_key_vault_secret.admin_username.value
  admin_password = data.azurerm_key_vault_secret.admin_password.value

  network_interface_ids = [azurerm_network_interface.network_interface[each.key].id]
  computer_name         = each.key

  os_disk {
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
    # disk_size_gb         = each.value["disk_size_gb"]
  }

  source_image_reference {
    publisher = each.value["publisher"]
    offer     = each.value["offer"]
    sku       = each.value["sku"]
    version   = each.value["version"]
  }

  # plan {
  #   publisher = each.value["publisher"]
  #   product   = each.value["offer"]
  #   name      = each.value["sku"]
  # }

  tags = merge(
    var.tags,
    {
      NAME          = each.key
      RESOURCE      = "azurerm_windows_virtual_machine",
      AUTO_SCHEDULE = each.value["auto_schedule"]
    },
  )
}


resource "azurerm_managed_disk" "manged_disk" {
  for_each             = var.vm_names
  name                 = "${each.key}-disk1"
  location             = var.location
  resource_group_name  = var.rg_workspace
  storage_account_type = "Standard_LRS"
  create_option        = "Empty"
  disk_size_gb         = each.value["disk_size_gb"]
}

resource "azurerm_virtual_machine_data_disk_attachment" "disk_attach" {
  for_each = var.vm_names

  managed_disk_id    = azurerm_managed_disk.manged_disk[each.key].id
  virtual_machine_id = azurerm_windows_virtual_machine.windows_VMs[each.key].id
  lun                = "10"
  caching            = "ReadWrite"
}
