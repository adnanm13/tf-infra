data "azurerm_subnet" "domain_subnet" {
  name                 = var.ad_subnet
  virtual_network_name = var.vpc_name
  resource_group_name  = var.rg_networking
}

resource "azurerm_active_directory_domain_service" "ad_domain" {
  name                      = var.ad_domain
  location                  = var.location
  resource_group_name       = var.rg_workspace
  domain_configuration_type = "FullySynced"
  domain_name               = var.ad_domain
  sku                       = "Standard"
  initial_replica_set {
    subnet_id = data.azurerm_subnet.domain_subnet.id
  }
  notifications {
    notify_dc_admins     = true
    notify_global_admins = true
  }
  security {
    ntlm_v1_enabled                 = false
    sync_kerberos_passwords         = true
    sync_ntlm_passwords             = true
    sync_on_prem_passwords          = true
    tls_v1_enabled                  = true
    kerberos_rc4_encryption_enabled = true
  }
  tags = merge(
    var.tags,
    {
      NAME     = var.ad_domain
      RESOURCE = "active_directory_domain_service"
    },
  )
}
