module "griffnose_vms" {
  source = "../../../modules/windowsVMsmarketplace"

  # variables
  vpc_name       = var.vpc_name
  location       = var.location
  rg_workspace   = var.rg_workspace
  rg_networking  = var.rg_networking
  rg_shared      = var.rg_shared
  avd_subnet     = var.avd_subnet
  vm_names       = var.vm_names
  tags           = var.tags
  vm_ids         = module.griffnose_vms.virtual_machines_ids
  key_vault_name = var.key_vault_name
}