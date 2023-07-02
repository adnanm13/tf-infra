variable "storage_accounts" {
  type = list(string)
}

variable "storage_containers" {
  type = map(any)
}

variable "location" {
  type = string
}

variable "rg_storage" {
  type = string
}

variable "tags" {
  type = map(any)
}