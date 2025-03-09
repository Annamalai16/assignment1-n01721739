variable "location" {
  description = "value of the location"
  type        = string
  default     = "East US"
}

variable "rg_name" {
  description = "value of the resource group name"
  type        = string
  default     = "default_rg"
}

variable "subnet_id" {
  description = "The ID of the subnet where the VMs will be created."
  type        = string
}

variable "dns_prefix" {
  description = "The DNS prefix for the public IP addresses."
  type        = string
  default     = "windows-vm"
}

variable "availability_set_name" {
  description = "The name of the availability set"
  type        = string
  default     = "default_avs"
}

variable "storage_account_uri" {
  description = "The URI of the storage account for boot diagnostics."
  type        = string
}

variable "admin_username" {
  description = "The admin username for the VMs."
  type        = string
  default     = "adminuser"
}

variable "admin_password" {
  description = "The admin password for the Windows VM."
  type        = string
  default     = "winadm!23"
}

variable "vm_extensions" {
  description = "The extensions to install on the VMs."
  type = list(object({
    name                 = string
    publisher            = string
    type                 = string
    type_handler_version = string
  }))
  default = []
}

variable "vm_count" {
  description = "The number of virtual machines to create."
  type        = number
  default     = 1
}

variable "vm_name" {
  description = "The size of the virtual machines."
  type        = string
  default     = "default-windows-vm"
}

variable "vm_size" {
  description = "The size of the virtual machines."
  type        = string
  default     = "Standard_B1s"
}

variable "source_image_reference" {
  description = "The source image reference for the virtual machines."
  type = object({
    publisher = string
    offer     = string
    sku       = string
    version   = string
  })
  default = {
    publisher = "MicrosoftWindowsServer"
    offer     = "WindowsServer"
    sku       = "2016-Datacenter"
    version   = "latest"
  }
}

variable "tags" {
  description = "Tags for the virtual machines."
  type        = map(string)
  default     = {}
}
