variable "vm_names" {
  type = any
}

variable "rg_workspace" {
  type = string
}


variable "rg_shared" {
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