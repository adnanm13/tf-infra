resource "azurerm_subnet" "subnets" {
  for_each             = var.subnets_config
  name                 = each.value["name"]
  resource_group_name  = var.rg_networking
  virtual_network_name = var.vpc_name
  address_prefixes     = [each.value["cidr"]]
}

