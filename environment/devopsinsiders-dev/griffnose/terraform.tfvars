# To find Machine Size https://azureprice.net/?sortField=numberOfCores&sortOrder=true

vm_names = {
  "Sql-Database01" = {
    "publisher"     = "center-for-internet-security-inc",
    "offer"         = "cis-windows-server-2016-v1-0-0-l2",
    "sku"           = "cis-ws2016-l2",
    "version"       = "latest"
    "machine_size"  = "Standard_B4ms",
    "disk_size_gb"  = "300",
    "auto_schedule" = "true"
  },

  "griffey-mgr01" = {
    "publisher"     = "center-for-internet-security-inc",
    "offer"         = "cis-windows-server-2016-v1-0-0-l2",
    "sku"           = "cis-ws2016-l2",
    "version"       = "latest"
    "machine_size"  = "Standard_B4ms",
    "disk_size_gb"  = "300",
    "auto_schedule" = "true"
  },

  "griffey-workr01" = {
    "publisher"     = "center-for-internet-security-inc",
    "offer"         = "cis-windows-server-2016-v1-0-0-l2",
    "sku"           = "cis-ws2016-l2",
    "version"       = "latest"
    "machine_size"  = "Standard_B4ms",
    "disk_size_gb"  = "300",
    "auto_schedule" = "true"
  },
}

vpc_name = "vnet-devopsinsiders-sit-uksouth-001"
location = "UK South"


rg_networking = "rg-devopsinsiders-networking"
rg_workspace  = "rg-devopsinsiders01-applications"
rg_shared     = "rg-devopsinsiders-sharedservices"

ad_domain = "devopsinsiderssolirius.onmicrosoft.com"
ad_subnet = "snet-devopsinsiders-aaad-services"

tags = {
  "CostCenter"         = "devopsinsiders01",
  "Deployment"         = "terraform",
  "Monitoring"         = "basic",
  "DailyBackups"       = "no",
  "BaseServerConfig"   = "no",
  "SeamlessDomainJoin" = "yes",
  "Patching"           = "no"
}

hostpool_name         = "hostpool-devopsinsiders-personaldesktops"
applicationgroup_name = "hostpool-devopsinsiders-personaldesktops-DAG"


avd_subnet = "snet-devopsinsiders-applications-uksouth-001"

key_vault_name = "kv-devopsinsiders"