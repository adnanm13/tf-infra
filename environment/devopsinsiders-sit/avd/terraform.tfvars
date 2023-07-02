vm_names = {
  "vm-devopsinsiders-avd-1" = {
    "source_image_id" = "devopsinsiders-avd-packer-custom-image-win10-v2.0.1",
    "auto_schedule"   = "true",
    "machine_size"    = "Standard_B4ms"
  },
  "vm-devopsinsiders-avd-2" = {
    "source_image_id" = "devopsinsiders-avd-packer-custom-image-win10-v2.0.1",
    "auto_schedule"   = "true",
    "machine_size"    = "Standard_B4ms"
  },
  "vm-devopsinsiders-avd-3" = {
    "source_image_id" = "devopsinsiders-avd-packer-custom-image-win10-v2.0.1",
    "auto_schedule"   = "true",
    "machine_size"    = "Standard_B4ms"
  },
  "vm-devopsinsiders-avd-4" = {
    "source_image_id" = "devopsinsiders-avd-packer-custom-image-win10-v2.0.1",
    "auto_schedule"   = "true",
    "machine_size"    = "Standard_B4ms"
  },
  "vm-devopsinsiders-avd-5" = {
    "source_image_id" = "devopsinsiders-avd-packer-custom-image-win10-v2.0.1",
    "auto_schedule"   = "true",
    "machine_size"    = "Standard_B4ms"
  },
  "vm-devopsinsiders-avd-6" = {
    "source_image_id" = "devopsinsiders-avd-packer-custom-image-win10-v2.0.1",
    "auto_schedule"   = "true",
    "machine_size"    = "Standard_B4ms"
  },
}

vpc_name = "vnet-devopsinsiders-sit-uksouth-001"
location = "UK South"

rg_networking = "rg-devopsinsiders-networking"
rg_workspace  = "rg-devopsinsiders-avd-workspace"

ad_domain = "devopsinsiderssolirius.onmicrosoft.com"
ad_subnet = "snet-devopsinsiders-aaad-services"

tags = {
  "BUSINESS_UNIT" = "devopsinsiders",
  "MAINTAIN_BY"   = "TERRAFORM"
}

hostpool_name         = "hostpool-devopsinsiders-personaldesktops"
applicationgroup_name = "hostpool-devopsinsiders-personaldesktops-DAG"


avd_subnet = "snet-devopsinsiders-avd-uksouth-001"

key_vault_name = "kv-devopsinsiders"
key_vault_rg   = "rg-devopsinsiders-sharedservices"
