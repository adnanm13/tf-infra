# Reference Azure Key Vault
data "azurerm_key_vault" "key_vault" {
  name                = var.key_vault_name
  resource_group_name = var.key_vault_rg
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

resource "azurerm_windows_virtual_machine" "virtual_machines" {
  for_each              = var.vm_names
  name                  = each.key
  resource_group_name   = var.rg_workspace
  location              = var.location
  size                  = each.value["machine_size"]
  network_interface_ids = [azurerm_network_interface.network_interface[each.key].id]
  admin_username        = data.azurerm_key_vault_secret.admin_username.value
  admin_password        = data.azurerm_key_vault_secret.admin_password.value
  computer_name         = each.key
  license_type          = "Windows_Client"

  os_disk {
    caching              = "ReadWrite"
    storage_account_type = "Premium_LRS"
    disk_size_gb         = 127
  }

  source_image_id = data.azurerm_image.custom_image[each.key].id

  tags = merge(
    var.tags,
    {
      NAME          = each.key
      RESOURCE      = "azurerm_windows_virtual_machine"
      AUTO_SCHEDULE = each.value["auto_schedule"]
    },
  )
}

