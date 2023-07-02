module "storage_account" {
  source = "../../../modules/storageAccounts"

  # variables
  location           = var.location
  rg_storage         = var.rg_storage
  tags               = var.tags
  storage_accounts   = var.storage_accounts
  storage_containers = var.storage_containers
}