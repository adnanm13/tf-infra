module "virtual_machines" {
  source = "../../../modules/virtualMachines"

  # variables
  vpc_name       = var.vpc_name
  location       = var.location
  rg_workspace   = var.rg_workspace
  rg_networking  = var.rg_networking
  avd_subnet     = var.avd_subnet
  vm_names       = var.vm_names
  tags           = var.tags
  key_vault_name = var.key_vault_name
  key_vault_rg   = var.key_vault_rg
}
