variable "vm_names" {
  type = any
}

variable "rg_workspace" {
  type = string
}

variable "rg_networking" {
  type = string
}

variable "location" {
  type = string
}

variable "avd_subnet" {
  type = string
}

variable "tags" {
  type = map(any)
}

variable "vpc_name" {
  type = any
}

variable "vm_ids" {
  type = map(any)
}

variable "key_vault_name" {
  type = string
}

variable "principal_id" {
  type    = string
  default = "6642caad-7e78-4a58-8d39-a50172913505"
}

variable "rg_shared" {
  type    = string
  default = "rg-devopsinsiders-sharedservices"
}

variable "ad_ip" {
  type    = string
  default = "10.0.3.6"
}

variable "ad_domain" {
  type    = string
  default = "devopsinsiderssit"
}

variable "group_name" {
  type = string
}