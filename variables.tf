#Module      : LABEL
#Description : Terraform label module variables.
variable "name" {
  type        = string
  default     = ""
  description = "Name  (e.g. `app` or `cluster`)."
}

variable "environment" {
  type        = string
  default     = ""
  description = "Environment (e.g. `prod`, `dev`, `staging`)."
}

variable "managedby" {
  type        = string
  default     = "anmol@opsstation.com"
  description = "ManagedBy, eg 'opsstation'."
}

variable "label_order" {
  type        = list(any)
  default     = ["name", "environment"]
  description = "Label order, e.g. `name`,`application`."
}
variable "repository" {
  type        = string
  default     = ""
  description = "Terraform current module repo"
}

## Common Variables

variable "enabled" {
  type        = bool
  default     = true
  description = "Flag to control the module creation."
}

variable "resource_group_name" {
  type        = string
  default     = ""
  description = "The name of the resource group in which to create the virtual network."
}

variable "location" {
  type        = string
  default     = ""
  description = "Location where resource should be created."
}

# Data Factory

variable "public_network_enabled" {
  type        = bool
  default     = true
  description = "Is the Data Factory visible to the public network? Defaults to true."
}

variable "managed_virtual_network_enabled" {
  type        = bool
  default     = null
  description = "Is default virtual machine enabled for data factory or not."
}

# Identity
variable "identity_type" {
  description = "Specifies the type of Managed Service Identity that should be configured on this Storage Account. Possible values are `SystemAssigned`, `UserAssigned`, `SystemAssigned, UserAssigned` (to enable both)."
  type        = string
  default     = "SystemAssigned"
}

variable "key_vault_id" {
  type    = string
  default = null
}

variable "cmk_encryption_enabled" {
  type    = bool
  default = false
}

# Private endpoint

variable "subnet_id" {
  type        = string
  default     = ""
  description = "The resource ID of the subnet"
}

variable "enable_private_endpoint" {
  type        = bool
  default     = false
  description = "enable or disable private endpoint to storage account"
}

variable "existing_private_dns_zone" {
  type        = string
  default     = null
  description = "Name of the existing private DNS zone"
}

variable "existing_private_dns_zone_resource_group_name" {
  type        = string
  default     = ""
  description = "The name of the existing resource group"
}

variable "private_dns_zone_name" {
  type        = string
  default     = "privatelink.blob.core.windows.net"
  description = "The name of the private dns zone name which will used to create private endpoint link."
}
