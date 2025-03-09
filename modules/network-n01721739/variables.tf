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

variable "vnet_name" {
  description = "Name of the virtual network"
  type        = string
  default     = "default_vnet"
}

variable "vnet_address_space" {
  description = "Address space for the virtual network"
  type        = list(string)
  default     = ["10.0.0.0/16"]
}

variable "subnet_name" {
  description = "Name of the first subnet"
  type        = string
  default     = "default_subnet"
}

variable "subnet_address_space" {
  description = "Address space for the first subnet"
  type        = list(string)
  default     = ["10.0.0.0/24"]
}

variable "nsg_name" {
  description = "Name of the Network Security Group"
  type        = string
  default     = "default_nsg"
}

variable "tags" {
  description = "value of the tags"
  type        = map(string)
  default     = {}
}
