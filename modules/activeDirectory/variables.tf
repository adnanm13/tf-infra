variable "ad_domain" {
  type = string
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


variable "rg_networking" {
  type = string
}

variable "ad_subnet" {
  type = string
}

variable "tags" {
  type = map(any)
}