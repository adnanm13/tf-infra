variable "keyvault_name" {
  type = string
}

variable "location" {
  type = string
}

variable "rg_application" {
  type = string
}

variable "object_id" {
  type = string
}

variable "tenant_id" {
  type = string
}

variable "tags" {
  type = map(any)
}