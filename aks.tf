resource "azurerm_kubernetes_cluster" "aks" {
  name = var.aks_name
  location = var.location
  resource_group_name = azurerm_resource_group.rg.name
  dns_prefix = "aks-dev"

  default_node_pool {
    name = "aksblue"
    node_count = 2
    vm_size = var.aks_vm_size
  }

  identity {
    type = "SystemAssigned"
  }

  tags = {
    "Environment" = var.environment
  }
}