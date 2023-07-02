resource "azurerm_storage_account" "storage_accounts" {
  for_each                 = toset(var.storage_accounts)
  name                     = each.key
  resource_group_name      = var.rg_storage
  location                 = var.location
  account_tier             = "Standard"
  account_replication_type = "RAGRS"

  tags = merge(
    var.tags,
    {
      NAME     = each.key
      RESOURCE = "azurerm_storage_account"
    },
  )
}