output "resource_group_name" {
  value = azurerm_resource_group.n01588261-rg.name
  description = "name of the resource group"
}

output "location" {
  value = azurerm_resource_group.n01588261-rg.location
}
