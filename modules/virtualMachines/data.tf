data "azurerm_image" "custom_image" {
  for_each            = var.vm_names
  name                = each.value["source_image_id"]
  resource_group_name = var.rg_workspace
}

