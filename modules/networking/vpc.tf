resource "azurerm_virtual_network" "vpc" {
  for_each            = var.vpc_config
  name                = each.value["name"]
  location            = var.location
  resource_group_name = var.rg_networking
  address_space       = each.value["address_space"]
  dns_servers         = each.value["dns_servers"]
  tags = merge(
    var.tags,
    {
      NAME     = each.value["name"]
      RESOURCE = "azurerm_virtual_network"
    },
  )
}
