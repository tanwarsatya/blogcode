

# setup the default provider for kubernetes
provider "kubernetes" {
  host                   = azurerm_kubernetes_cluster.aksmultizone.kube_config.0.host
  client_certificate     = base64decode(azurerm_kubernetes_cluster.aksmultizone.kube_config.0.client_certificate)
  client_key             = base64decode(azurerm_kubernetes_cluster.aksmultizone.kube_config.0.client_key)
  cluster_ca_certificate = base64decode(azurerm_kubernetes_cluster.aksmultizone.kube_config.0.cluster_ca_certificate)
}

# Create a namespace to host containers
resource "kubernetes_namespace" "podswithconstrains" {
  metadata {
    name = "podswithconstrains"
  }
}

# Create deployment with pod-topology-spread-constraints