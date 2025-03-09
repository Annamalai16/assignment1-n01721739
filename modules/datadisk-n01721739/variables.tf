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

variable "data_disk_name" {
  description = "The name of the data disks."
  type        = string
  default     = "default_data_disk"
}

variable "vm_ids" {
  description = "The IDs of the virtual machines."
  type        = list(string)
  default     = []
}

variable "data_disk_count" {
  description = "The number of data disks to create."
  type        = number
  default     = 1
}

variable "tags" {
  description = "Tags for the virtual machines."
  type        = map(string)
  default     = {}
}