data "azurerm_key_vault_secret" "devopsinsiders-ad-password" {
  name         = "devopsinsiders-sit-ad-password"
  key_vault_id = data.azurerm_key_vault.key_vault.id
}


data "template_file" "ad_data" {
  template = file("${path.module}/script.sh")
  vars = {
    adpass     = data.azurerm_key_vault_secret.devopsinsiders-ad-password.value,
    ad_domain  = var.ad_domain
    ad_ip      = var.ad_ip
    group_name = var.group_name
  }
}

# resource "azurerm_virtual_machine_extension" "AADLoginForLinux" {
#   for_each                   = tomap(var.vm_ids)
#   depends_on                 = [azurerm_linux_virtual_machine.linux_VMs]
#   name                       = "AADLoginForLinux"
#   virtual_machine_id         = each.value
#   publisher                  = "Microsoft.Azure.ActiveDirectory.LinuxSSH"
#   type                       = "AADLoginForLinux"
#   type_handler_version       = "1.0"
#   auto_upgrade_minor_version = true
# }


resource "azurerm_virtual_machine_extension" "ADLoginForLinux" {
  for_each           = tomap(var.vm_ids)
  depends_on         = [azurerm_linux_virtual_machine.linux_VMs]
  name               = "ADLoginForLinux"
  virtual_machine_id = each.value

  publisher            = "Microsoft.Azure.Extensions"
  type                 = "CustomScript"
  type_handler_version = "2.0"

  protected_settings = <<PROT
    {
        "script": "${base64encode(data.template_file.ad_data.rendered)}"
    }
    PROT
}


resource "azurerm_role_assignment" "assign-vm-role" {
  for_each             = tomap(var.vm_ids)
  depends_on           = [azurerm_linux_virtual_machine.linux_VMs]
  scope                = each.value
  role_definition_name = "Virtual Machine Administrator Login"
  principal_id         = var.principal_id
}
