resource "azurerm_resource_group" "rg" {
    name = var.resourcegroup_name
    location = var.location

    tags = {
      "Environment" = var.environment
    }
}