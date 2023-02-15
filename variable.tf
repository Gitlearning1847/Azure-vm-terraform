variable "azurerm_resource_group" {
  type = string
  description = " This is the resource group for all the resources"
  default = "rg"
}

variable "location" {
  type = string
  description = "This is the perfer location to deploy all the resources"
  default = "Eastus"
}

variable "azurerm_virtual_network" {
  type = string
  description = "This the vnet to connect those resources"
  default = "vnet"
}

variable "azurerm_subnet" {
  type = string
  description = "this is the subnet for the vnet"
  default = "subnet"
}

variable "azurerm_network_interface" {
  type = string
  description = "this is the network interface"
  default = "ninterface"
}

variable "azurerm_windows_virtual_machine" {
    type = string
    description = "this is the vm"
    default = "vm"
  
}
variable "Environment" {
    type = string
    description = "This is the environment to deploy all resources"
    default = "Liberia"

  
}
variable "website" {
  type = string
   description = "this is the website to be built"
   default = "website"
}

variable "azurerm_public_ip" {
  type = string
  default = "ip"
  description = "this is the public ip"

}

variable "admin_password" {
  sensitive =true
}