resource "azurerm_kubernetes_cluster" "aks" {
  name = var.name
  location = var.location
  resource_group_name = var.rg_name
  dns_prefix = "aks-sir1-dev"

  default_node_pool {
    name = "default"
    node_count = var.node_count
    vm_size = "Standard_D2s_v4"
    vnet_subnet_id = var.subnetid
  }
network_profile {
  network_plugin = "azure"
  service_cidr = "172.16.0.0/16"
  dns_service_ip = "172.16.0.10"
}
  identity {
    type = "SystemAssigned"
  }
}