resource "azurerm_resource_group" "podconstraints" {
  name     = "podconstraints"
  location = "East Us"
}

resource "azurerm_kubernetes_cluster" "aksmultizone" {
  name                = "aks-multizone"
  location            = azurerm_resource_group.podconstraints.location
  resource_group_name = azurerm_resource_group.podconstraints.name
  dns_prefix          = "aksmultizone"
  kubernetes_version  = "1.21.2"

  default_node_pool {
    name       = "default"
    node_count = 6
    vm_size    = "Standard_B2s"
    availability_zones = ["1", "2", "3"] 
   
  }

  identity {
    type = "SystemAssigned"
  }

  tags = {
    Environment = "dev"
  }
}

output "client_certificate" {
  value = azurerm_kubernetes_cluster.aksmultizone.kube_config.0.client_certificate
}

output "kube_config" {
  value = azurerm_kubernetes_cluster.aksmultizone.kube_config_raw
  sensitive = true
}

