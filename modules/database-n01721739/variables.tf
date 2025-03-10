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

variable "db_server_name" {
  description = "The name of the PostgreSQL server."
  type        = string
  default     = "default_db_server"
}

variable "db_name" {
  description = "The name of the PostgreSQL database."
  type        = string
  default     = "default_db"
}

variable "db_admin_username" {
  description = "The admin username for the PostgreSQL server."
  type        = string
  default     = "adminuser"
}

variable "db_admin_password" {
  description = "The admin password for the PostgreSQL server."
  type        = string
  default     = "admin!23"
}

variable "storage_mb" {
  description = "The storage capacity of the PostgreSQL server."
  type        = number
  default     = 5120
}

variable "backup_retention_days" {
  description = "The number of days to retain backups for the PostgreSQL server."
  type        = number
  default     = 7
}

variable "tags" {
  description = "Tags for the virtual machines."
  type        = map(string)
  default     = {}
}