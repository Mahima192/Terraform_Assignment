variable "resource_group_name" {}

variable  "common_tags" {}

variable "location" {}

variable "vnet_name" {
  type    = string
  default = "n01588261-vnet"
}

variable "vnet_address_space" {
  default = ["10.0.0.0/16"]
}

variable "subnet_name" {
  type    = string
  default = "n01588261-subnet"
}

variable "subnet_prefixes" {
  default = ["10.0.0.0/24"]
}

variable "nsg_name" {
  type    = string
  default = "n01588261-nsg"
}
