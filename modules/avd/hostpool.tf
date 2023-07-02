# Create AVD host pool
resource "azurerm_virtual_desktop_host_pool" "hostpool" {
  resource_group_name              = var.rg_workspace
  location                         = var.location
  name                             = var.hostpool_name
  validate_environment             = false
  description                      = "Created through the Azure Virtual Desktop extension"
  type                             = "Personal"
  maximum_sessions_allowed         = 999999
  load_balancer_type               = "Persistent"
  personal_desktop_assignment_type = "Direct"
  start_vm_on_connect              = true
  custom_rdp_properties            = "drivestoredirect:s:*;audiomode:i:0;videoplaybackmode:i:1;redirectclipboard:i:1;redirectprinters:i:1;devicestoredirect:s:*;redirectcomports:i:1;redirectsmartcards:i:1;usbdevicestoredirect:s:*;enablecredsspsupport:i:1;use multimon:i:1;"
  tags = merge(
    var.tags,
    {
      NAME     = var.hostpool_name
      RESOURCE = "azurerm_virtual_desktop_host_pool"
    },
  )
}

# Create Application Groups
resource "azurerm_virtual_desktop_application_group" "applicationgroup" {
  name                = var.applicationgroup_name
  location            = var.location
  resource_group_name = var.rg_workspace

  type                         = "Desktop"
  host_pool_id                 = azurerm_virtual_desktop_host_pool.hostpool.id
  friendly_name                = "Default Desktop"
  description                  = "Desktop Application Group created through the Hostpool Wizard"
  default_desktop_display_name = "SessionDesktop"
  tags = merge(
    var.tags,
    {
      NAME     = "var.applicationgroup_name"
      RESOURCE = "azurerm_virtual_desktop_application_group"
    },
  )

}


