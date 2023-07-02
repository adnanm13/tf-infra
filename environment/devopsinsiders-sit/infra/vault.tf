module "keyVault" {
  source = "../../../modules/keyVault"

  # variables
  keyvault_name  = var.keyvault_name
  location       = var.location
  rg_application = var.rg_shared
  tags           = var.tags
  object_id      = var.object_id
  tenant_id      = var.tenant_id
}