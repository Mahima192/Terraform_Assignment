locals {
  common_tags = {
    Assignment = "CCGC 5502 Automation Assignment"
    Name = "Mahima Shastri"
    ExpirationDate = "2024-12-31"
    Environment = "Learning"
  }
}

variable "location" {
  description = "Location for the resource group"
  type        = string
  default     = "canadacentral"
}

variable "resource_group_name" {
	default	= "n01588261-RG"
}

variable "vnet_name" {
	default	= "n01588261-VNET"
}

variable "subnet_name" {
	default = "n01588261-SUBNET"
}

variable "nsg_name" {
	default = "n01588261-NSG"
}
