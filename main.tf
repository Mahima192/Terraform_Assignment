module "rgroup-n01588261" {
  source = "./modules/rgroup-n01588261"

   resource_group_name = var.resource_group_name
   location = var.location 

   common_tags = local.common_tags
}

module "network-n01588261" {
  source = "./modules/network-n01588261"
  
  resource_group_name = module.rgroup-n01588261.resource_group_name
  location = module.rgroup-n01588261.location
  
  vnet_name = var.vnet_name
  subnet_name = var.subnet_name
  nsg_name = var.nsg_name

  common_tags = local.common_tags
}

module "common-n01588261" {
  source = "./modules/common-n01588261"
  
  resource_group_name = module.rgroup-n01588261.resource_group_name
  location = module.rgroup-n01588261.location

  common_tags = local.common_tags
}

module "vmlinux-n01588261" {
  source = "./modules/vmlinux-n01588261"
  
  resource_group_name = module.rgroup-n01588261.resource_group_name
  location = module.rgroup-n01588261.location
  
  subnet_id =  module.network-n01588261.subnet_id
  storage_account_uri = module.common-n01588261.storage_account-primary_blob_endpoint
  
  common_tags = local.common_tags
}

module "vmwindows-n01588261" {
  source = "./modules/vmwindows-n01588261"
  
  resource_group_name = module.rgroup-n01588261.resource_group_name
  location = module.rgroup-n01588261.location
  
  subnet_id =  module.network-n01588261.subnet_id
  storage_account_uri = module.common-n01588261.storage_account-primary_blob_endpoint
  common_tags = local.common_tags
}

module "datadisk-n01588261" {
  source = "./modules/datadisk-n01588261"
  
  resource_group_name = module.rgroup-n01588261.resource_group_name
  location = module.rgroup-n01588261.location

  linux_vm_ids        = module.vmlinux-n01588261.vmlinux.ids 
  windows_vm_ids      = module.vmwindows-n01588261.windows.ids
  
  all_vm_ids = concat(module.vmlinux-n01588261.vmlinux.ids, module.vmwindows-n01588261.windows.ids) 
  common_tags = local.common_tags
}

module "loadbalancer-n01588261" {
  source              = "./modules/loadbalancer-n01588261"
  
  resource_group_name = module.rgroup-n01588261.resource_group_name
  location = module.rgroup-n01588261.location
 
  linux_vm_nic_ids           =module.vmlinux-n01588261.vmlinux-nic-ids
  linux_vm_name              = module.vmlinux-n01588261.vmlinux.hostnames
  common_tags = local.common_tags
}

module "database-n01588261" {
  source = "./modules/database-n01588261"
  
  resource_group_name          = module.rgroup-n01588261.resource_group_name
  location                     = module.rgroup-n01588261.location
  common_tags = local.common_tags
}
