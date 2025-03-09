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

variable "lb_name" {
  description = "The name of the load balancer."
  type        = string
  default     = "default_lb"
}

variable "vm_nic_ids" {
  description = "The IDs of the network interfaces."
  type        = list(string)
}

variable "tags" {
  description = "Tags for the virtual machines."
  type        = map(string)
  default     = {}
}