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

variable "law_name" {
  description = "The base name for the Log Analytics workspace."
  type        = string
  default     = "default_law"
}

variable "rsv_name" {
  description = "The base name for the Recovery Services Vault."
  type        = string
  default     = "default_rsv"
}

variable "sa_name" {
  description = "The base name for the Storage Account."
  type        = string
  default     = "default_sa"
}

variable "tags" {
  description = "The common tags to apply to the resources."
  type        = map(string)
  default     = {}
}
