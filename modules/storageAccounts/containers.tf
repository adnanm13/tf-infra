resource "azurerm_storage_container" "storage_containers" {
  for_each              = var.storage_containers
  name                  = each.key
  storage_account_name  = each.value["storage_account"]
  container_access_type = "private"
}