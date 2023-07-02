# Reference Key Vault Secret
data "azurerm_key_vault_secret" "devopsinsiders-sit-local-username" {
  name         = "devopsinsiders-sit-local-username"
  key_vault_id = data.azurerm_key_vault.key_vault.id
}

data "azurerm_key_vault_secret" "devopsinsiders-sit-local-password" {
  name         = "devopsinsiders-sit-local-password"
  key_vault_id = data.azurerm_key_vault.key_vault.id
}

data "template_file" "tf" {
  template = file("${path.module}/userdata.ps1")
}

resource "azurerm_virtual_machine_extension" "powershell_userdata" {
  for_each = tomap(var.vm_ids)
  depends_on = [
    azurerm_virtual_machine_data_disk_attachment.disk_attach
  ]
  name                 = "powershell_userdata"
  virtual_machine_id   = each.value
  publisher            = "Microsoft.Compute"
  type                 = "CustomScriptExtension"
  type_handler_version = "1.10"

  settings = <<SETTINGS
    {
      "commandToExecute": "powershell -command \"[System.Text.Encoding]::UTF8.GetString([System.Convert]::FromBase64String('${base64encode(data.template_file.tf.rendered)}')) | Out-File -filepath userdata.ps1\" && powershell -ExecutionPolicy Unrestricted -File userdata.ps1 -username ${data.azurerm_key_vault_secret.devopsinsiders-sit-local-username.value} -password ${data.azurerm_key_vault_secret.devopsinsiders-sit-local-password.value} 2>C:\\errors.txt 1>C:\\output.txt "
    }
SETTINGS

  tags = merge(
    var.tags,
    {
      NAME     = "rdp_group_add"
      RESOURCE = "azurerm_virtual_machine_extension"
    },
  )
}


