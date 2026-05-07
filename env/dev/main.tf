module "rg" {
  source = "../../modules/resourcegroup"
  name = var.rg_name
  location = var.location
}
/*module "storage" {
  source = "../../modules/storage"

  name     = var.storage_name
  rg_name  = module.rg.rg_name
  location = module.rg.location
}*/

module "vnet" {
source = "../../modules/vnet"
name="vnet-dev"
rg_name = module.rg.rg_name  
location = module.rg.location
}

module "aks" {
  source = "../../modules/aks"
  name = "aks-dev"
  rg_name = module.rg.rg_name
  location = module.rg.location
  subnetid = module.vnet.subnetid
  node_count = var.node_count
  subnet_cidr = var.subnet_cidr
  dns_service_ip = var.dns_service_ip
  vm_size = var.vm_size
  service_cidr = var.service_cidr
}
