variable "resource_groups_config" {
  type = any
}

variable "vpc_config" {
  type = any
}

variable "subnets_config" {
  type = map(any)
}

variable "vpc_name" {
  type = string
}

variable "location" {
  type = string
}

variable "rg_workspace" {
  type = string
}

variable "ad_domain" {
  type = string
}

variable "ad_subnet" {
  type = string
}

variable "tags" {
  type = map(any)
}

variable "rg_networking" {
  type = string
}

variable "hostpool_name" {
  type = string

}

variable "avd_subnet" {
  type = string
}

variable "applicationgroup_name" {
  type = string
}

variable "storage_accounts" {
  type = list(string)
}

variable "rg_storage" {
  type = string
}

variable "storage_containers" {
  type = map(any)
}

variable "rg_application" {
  type = string
}

variable "rg_shared" {
  type = string
}
variable "keyvault_name" {
  type = string
}

variable "object_id" {
  type = string
}

variable "tenant_id" {
  type = string
}