output "virtual_machines_ids" {
  value = { for vm in keys(var.vm_names) : vm => azurerm_windows_virtual_machine.windows_VMs[vm].id }
}