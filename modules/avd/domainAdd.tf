# Reference Azure Key Vault
data "azurerm_key_vault" "key_vault" {
  name                = var.key_vault_name
  resource_group_name = var.key_vault_rg
}
# Reference Key Vault Secret
data "azurerm_key_vault_secret" "domainjoin_username" {
  name         = "domainjoin-username"
  key_vault_id = data.azurerm_key_vault.key_vault.id
}

data "azurerm_key_vault_secret" "domainjoin_password" {
  name         = "domainjoin-password"
  key_vault_id = data.azurerm_key_vault.key_vault.id
}

# Create Domain Join
resource "azurerm_virtual_machine_extension" "domainjoin" {
  for_each                   = tomap(var.vm_ids)
  name                       = "joindomain"
  virtual_machine_id         = each.value
  publisher                  = "Microsoft.Compute"
  type                       = "JsonADDomainExtension"
  type_handler_version       = "1.3"
  auto_upgrade_minor_version = true
  automatic_upgrade_enabled  = false

  settings = <<SETTINGS
        {
        "name": "devopsinsiderssolirius.onmicrosoft.com",
        "ouPath": "",
        "options": "3",
        "restart": "true",
        "user": "${data.azurerm_key_vault_secret.domainjoin_username.value}"
        }
    SETTINGS

  protected_settings = <<PROTECTED_SETTINGS
      {
        "Password": "${data.azurerm_key_vault_secret.domainjoin_password.value}"
      }
    PROTECTED_SETTINGS

  lifecycle {
    ignore_changes = [settings, protected_settings]
  }

  tags = merge(
    var.tags,
    {
      NAME     = "joindomain"
      RESOURCE = "azurerm_virtual_machine_extension"
    },
  )

}

resource "azurerm_virtual_machine_extension" "hostpool-dsc" {
  for_each                   = tomap(var.vm_ids)
  name                       = "Microsoft.PowerShell.DSC"
  virtual_machine_id         = each.value
  publisher                  = "Microsoft.Powershell"
  type                       = "DSC"
  type_handler_version       = "2.73"
  auto_upgrade_minor_version = true

  settings = "{\"configurationFunction\":\"Configuration.ps1\\\\AddSessionHost\",\"modulesUrl\":\"https://wvdportalstorageblob.blob.core.windows.net/galleryartifacts/Configuration_06-15-2022.zip\",\"properties\":{\"UseAgentDownloadEndpoint\":true,\"aadJoin\":false,\"aadJoinPreview\":false,\"hostPoolName\":\"hostpool-devopsinsiders-personaldesktops\",\"mdmId\":\"\",\"registrationInfoToken\":\"${var.registrationToken}\",\"sessionHostConfigurationLastUpdateTime\":\"\"}}"

  tags = merge(
    var.tags,
    {
      NAME     = "Microsoft.PowerShell.DSC"
      RESOURCE = "azurerm_virtual_machine_extension"
    },
  )
}