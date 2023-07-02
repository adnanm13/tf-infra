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

variable "vm_names" {
  type = any
}

# variable "source_image_id" {
#     type = string
# }

variable "applicationgroup_name" {
  type = string
}
variable "key_vault_name" {
  type = string
}

variable "key_vault_rg" {
  type = string
}