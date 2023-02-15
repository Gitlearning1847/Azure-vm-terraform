variable "azurerm_resource_group" {
  type = string
  description = "Local resource group name"
  default = "mylab-rg"
}

variable "location" {
  type = string
  description = "location for all resources"
  default = "east us"
}