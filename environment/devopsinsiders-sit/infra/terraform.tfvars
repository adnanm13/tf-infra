resource_groups_config = {
  rg1 = {
    name     = "rg-devopsinsiders-applications"
    location = "UK South"
  }
  rg2 = {
    name     = "rg-devopsinsiders-avd-workspace"
    location = "UK South"
  }
  rg3 = {
    name     = "rg-devopsinsiders-networking"
    location = "UK South"
  }
  rg4 = {
    name     = "rg-devopsinsiders-sharedservices"
    location = "UK South"
  }
  rg5 = {
    name     = "rg-devopsinsiders-storage-accounts"
    location = "UK South"
  }
}

vpc_config = {
  vpc-001 = {
    name          = "vnet-devopsinsiders-sit-uksouth-001"
    address_space = ["10.0.0.0/16"]
    dns_servers   = ["10.0.3.4", "10.0.3.5"]
  }
}

subnets_config = {
  sub-1 = {
    name = "snet-devopsinsiders-avd-uksouth-001"
    cidr = "10.0.0.0/24"
  }
  sub-2 = {
    name = "snet-devopsinsiders-sharedservices-uksouth-001"
    cidr = "10.0.1.0/24"
  }
  sub-3 = {
    name = "snet-devopsinsiders-applications-uksouth-001"
    cidr = "10.0.2.0/24"
  }
  sub-4 = {
    name = "snet-devopsinsiders-aaad-services"
    cidr = "10.0.3.0/24"
  }
}

storage_accounts = ["devopsinsiders", "devopsinsidersdataimport"]

storage_containers = {
  "devopsinsiders-data"        = { "storage_account" = "devopsinsiders" },
  "terraform"        = { "storage_account" = "devopsinsiders" },
  "devopsinsiders-data-import" = { "storage_account" = "devopsinsidersdataimport" }
}


vpc_name = "vnet-devopsinsiders-sit-uksouth-001"
location = "UK South"

rg_networking  = "rg-devopsinsiders-networking"
rg_workspace   = "rg-devopsinsiders-avd-workspace"
rg_storage     = "rg-devopsinsiders-storage-accounts"
rg_application = "rg-devopsinsiders-applications"
rg_shared      = "rg-devopsinsiders-sharedservices"

ad_domain = "devopsinsiderssolirius.onmicrosoft.com"
ad_subnet = "snet-devopsinsiders-aaad-services"

tags = {
  "BUSINESS_UNIT" = "devopsinsiders",
  "MAINTAIN_BY"   = "TERRAFORM"
}

hostpool_name         = "hostpool-devopsinsiders-personaldesktops"
applicationgroup_name = "hostpool-devopsinsiders-personaldesktops-DAG"


avd_subnet = "snet-devopsinsiders-avd-uksouth-001"

keyvault_name = "kv-devopsinsiders"
tenant_id     = "53a06517-baca-4756-9b4a-88ee903c58ef"
object_id     = "f42f2c76-7f55-4fa8-8a60-802e20bfeaef"