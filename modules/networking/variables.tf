variable "vpc_config" {
  type = any
}

variable "subnets_config" {
  type = map(any)
}

variable "vpc_name" {
  type = string
}

variable "rg_networking" {
  type = string
}

variable "location" {
  type = string
}

variable "tags" {
  type = map(any)
}