# To find Machine Size https://azureprice.net/?sortField=numberOfCores&sortOrder=true

vm_names = {
  "Sql-Database" = {
    "publisher"     = "center-for-internet-security-inc",
    "offer"         = "cis-windows-server-2016-v1-0-0-l2",
    "sku"           = "cis-ws2016-l2",
    "version"       = "latest"
    "machine_size"  = "Standard_A8_v2",
    "disk_size_gb"  = "300",
    "auto_schedule" = "true"
  },

  "griffey-manager" = {
    "publisher"     = "center-for-internet-security-inc",
    "offer"         = "cis-windows-server-2016-v1-0-0-l2",
    "sku"           = "cis-ws2016-l2",
    "version"       = "latest"
    "machine_size"  = "Standard_A8_v2",
    "disk_size_gb"  = "300",
    "auto_schedule" = "true"
  },

  "griffey-worker" = {
    "publisher"     = "center-for-internet-security-inc",
    "offer"         = "cis-windows-server-2016-v1-0-0-l2",
    "sku"           = "cis-ws2016-l2",
    "version"       = "latest"
    "machine_size"  = "Standard_A8_v2",
    "disk_size_gb"  = "300",
    "auto_schedule" = "true"
  },
}

vpc_name = "vnet-devopsinsiders-sit-uksouth-001"
location = "UK South"


rg_networking = "rg-devopsinsiders-networking"
rg_workspace  = "rg-devopsinsiders-applications"
rg_shared     = "rg-devopsinsiders-sharedservices"
ad_domain     = "devopsinsiderssolirius.onmicrosoft.com"
ad_subnet     = "snet-devopsinsiders-aaad-services"

tags = {
  "Application_Name"   = "griffnose"
  "CostCenter"         = "devopsinsiders",
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