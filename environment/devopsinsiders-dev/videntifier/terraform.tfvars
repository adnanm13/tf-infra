# To find Machine Size https://azureprice.net/?sortField=numberOfCores&sortOrder=true

vm_names = {
  "Videntifier01" = {
    "publisher"     = "center-for-internet-security-inc",
    "offer"         = "cis-rhel-7-v2-2-0-l1",
    "sku"           = "cis-rhel7-l1",
    "version"       = "latest"
    "machine_size"  = "Standard_B4ms",
    "disk_size_gb"  = "300",
    "disk_type"     = "StandardSSD_LRS",
    "auto_schedule" = "true"
  },

}

vpc_name = "vnet-devopsinsiders-sit-uksouth-001"
location = "UK South"


rg_networking = "rg-devopsinsiders-networking"
rg_workspace  = "rg-devopsinsiders01-applications"

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