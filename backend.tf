terraform {
  backend "azurerm" {
    resource_group_name  = "tfstateN01588261RG"
    storage_account_name = "tfstaten01588261sa"
    container_name       = "n01588261terraform"
    key                  = "terraform.tfstate"
  }
}
