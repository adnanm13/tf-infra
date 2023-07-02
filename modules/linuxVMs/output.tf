output "virtual_machines_ids" {
  value = { for vm in keys(var.vm_names) : vm => azurerm_linux_virtual_machine.linux_VMs[vm].id }
}