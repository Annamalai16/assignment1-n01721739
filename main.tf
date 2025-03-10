locals {
  common_tags = {
    Assignment     = "CCGC 5502 Automation Assignment"
    Name           = "annamalai.muthukumar"
    ExpirationDate = "2024-12-31"
    Environment    = "Learning"
  }
}

module "resource_group" {
  source   = "./modules/rgroup-n01721739"
  location = "East US"
  rg_name  = "n01721739-RG"
  tags     = local.common_tags
}

module "network" {
  source               = "./modules/network-n01721739"
  location             = "East US"
  rg_name              = module.resource_group.rg_name
  vnet_name            = "n01721739-VNET"
  vnet_address_space   = ["10.0.0.0/16"]
  subnet_name          = "n01721739-SUBNET"
  subnet_address_space = ["10.0.1.0/24"]
  nsg_name             = "n01721739-NSG"
  tags                 = local.common_tags
}

module "common" {
  source   = "./modules/common-n01721739"
  location = "East US"
  rg_name  = module.resource_group.rg_name
  law_name = "n01721739-LAW"
  rsv_name = "n01721739-RSV"
  sa_name  = "n01721739sa"
  tags     = local.common_tags
}

module "vm_linux" {
  source                = "./modules/vmlinux-n01721739"
  rg_name               = module.resource_group.rg_name
  location              = "East US"
  subnet_id             = module.network.subnet_id
  availability_set_name = "n01721739-LINUX-AVS"
  storage_account_uri   = module.common.storage_account_uri
  admin_username        = "n01721739"
  private_key_path      = "~/.ssh/id_rsa"
  ssh_public_key_path   = "~/.ssh/id_rsa.pub"
  vm_config = {
    "linux-vm1" = {
      size = "Standard_B1ms"
      source_image_reference = {
        publisher = "OpenLogic"
        offer     = "CentOS"
        sku       = "8_2"
        version   = "latest"
      }
    }
  }
  vm_extensions = [
    {
      name                 = "NetworkWatcherExtension"
      publisher            = "Microsoft.Azure.NetworkWatcher"
      type                 = "NetworkWatcherAgentLinux"
      type_handler_version = "1.4"
    },
    {
      name                 = "AzureMonitorExtension"
      publisher            = "Microsoft.Azure.Monitor"
      type                 = "AzureMonitorLinuxAgent"
      type_handler_version = "1.9"
    }
  ]
  tags = local.common_tags
}

module "vm_windows" {
  source                = "./modules/vmwindows-n01721739"
  rg_name               = module.resource_group.rg_name
  location              = "East US"
  subnet_id             = module.network.subnet_id
  dns_prefix            = "n01721739-vm-w"
  availability_set_name = "n01721739-WINDOWS-AVS"
  storage_account_uri   = module.common.storage_account_uri
  admin_username        = "n01721739"
  admin_password        = "winadm!23"
  vm_count              = 1
  vm_name               = "windows-vm"
  vm_size               = "Standard_B1ms"
  source_image_reference = {
    publisher = "MicrosoftWindowsServer"
    offer     = "WindowsServer"
    sku       = "2016-Datacenter"
    version   = "latest"
  }
  vm_extensions = [
    {
      name                 = "AntiMalwareExtension"
      publisher            = "Microsoft.Azure.Security"
      type                 = "IaaSAntimalware"
      type_handler_version = "1.5"
    }
  ]
  tags = local.common_tags
}

module "data_disk" {
  source   = "./modules/datadisk-n01721739"
  location = "East US"
  rg_name  = module.resource_group.rg_name
  data_disk_name = "n01721739-DD"
  vm_ids   = concat(module.vm_linux.vm_ids, module.vm_windows.vm_ids)
  tags     = local.common_tags
}

module "load_balancer" {
  source     = "./modules/loadbalancer-n01721739"
  location   = "East US"
  rg_name    = module.resource_group.rg_name
  lb_name    = "n01721739-LB"
  vm_nic_ids = concat(module.vm_linux.vm_nic_ids, module.vm_windows.vm_nic_ids)
  tags       = local.common_tags
}

module "database" {
  source            = "./modules/database-n01721739"
  location          = "East US"
  rg_name           = module.resource_group.rg_name
  db_name           = "n01721739-db"
  db_server_name    = "n01721739-db-svr"
  db_admin_username = "n01721739"
  db_admin_password = "dbadm!23"
  storage_mb        = 5120
  backup_retention_days = 7
  tags              = local.common_tags
}