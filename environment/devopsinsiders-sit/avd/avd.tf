module "avd" {
  source = "../../../modules/avd"

  # variables
  location              = var.location
  rg_workspace          = var.rg_workspace
  vm_names              = var.vm_names
  tags                  = var.tags
  hostpool_name         = var.hostpool_name
  applicationgroup_name = var.applicationgroup_name
  vm_ids                = module.virtual_machines.virtual_machines_ids
  key_vault_name        = var.key_vault_name
  key_vault_rg          = var.key_vault_rg
}
