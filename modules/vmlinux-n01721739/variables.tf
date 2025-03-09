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

variable "private_key_path" {
  description = "Path to the private key for SSH access to the Linux VM."
  type        = string
  default     = "~/.ssh/id_rsa"
}

variable "ssh_public_key_path" {
  description = "Path to the SSH public key for Linux VM"
  type        = string
  default     = "~/.ssh/id_rsa.pub"
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

variable "vm_config" {
  description = "The names of the VMs to create."
  type = map(object({
    size = string
    source_image_reference = object({
      publisher = string
      offer     = string
      sku       = string
      version   = string
    })
  }))
  default = {
    "default-linux-vm1" = {
      size = "Standard_B1s"
      source_image_reference = {
        publisher = "OpenLogic"
        offer     = "CentOS"
        sku       = "8_2"
        version   = "latest"
      }
    }
  }
}

variable "tags" {
  description = "value of the tags"
  type        = map(string)
  default     = {}
}

