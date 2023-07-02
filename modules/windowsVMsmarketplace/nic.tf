data "azurerm_subnet" "avd_subnet" {
  name                 = var.avd_subnet
  virtual_network_name = var.vpc_name
  resource_group_name  = var.rg_networking
}

resource "azurerm_network_interface" "network_interface" {
  for_each            = var.vm_names
  name                = "${each.key}-nic"
  location            = var.location
  resource_group_name = var.rg_workspace

  ip_configuration {
    name                          = "ipconfig"
    subnet_id                     = data.azurerm_subnet.avd_subnet.id
    private_ip_address_allocation = "Dynamic"
  }

  tags = merge(
    var.tags,
    {
      NAME     = "${each.key}-nic"
      RESOURCE = "azurerm_network_interface"
    },
  )
}