resource "azurerm_resource_group" "Liberia" {
  name     = "${var.Environment}-${var.website}-${var.azurerm_resource_group}"
  location = var.location
}

resource "azurerm_virtual_network" "Liberia" {
  name                = "${var.Environment}-${var.website}-${var.azurerm_virtual_network}"
  address_space       = ["10.0.0.0/16"]
  location            =var.location
  resource_group_name = "${var.Environment}-${var.website}-${var.azurerm_resource_group}"
}

resource "azurerm_subnet" "Liberia" {
  name                 = "${var.Environment}-${var.website}-${var.azurerm_subnet}" 
  resource_group_name  = "${var.Environment}-${var.website}-${var.azurerm_resource_group}"
  virtual_network_name = "${var.Environment}-${var.website}-${var.azurerm_virtual_network}"
  address_prefixes     = ["10.0.1.0/24"]
}

resource "azurerm_network_interface" "Liberia" {
  name                = "${var.Environment}-${var.website}-${var.azurerm_network_interface}"
  location            = var.location
  resource_group_name ="${var.Environment}-${var.website}-${var.azurerm_resource_group}"

  ip_configuration {
    name                          = "internal"
    subnet_id                     = azurerm_subnet.Liberia.id
    private_ip_address_allocation = "Dynamic"
    public_ip_address_id = azurerm_public_ip.Liberia.id
  }
}

resource "azurerm_windows_virtual_machine" "Liberia" {
    computer_name = "Arthur"
  name                ="${var.Environment}-${var.website}-${var.azurerm_windows_virtual_machine}"
  resource_group_name ="${var.Environment}-${var.website}-${var.azurerm_resource_group}"
  location            = var.location

  size                = "Standard_F2"
  admin_username      = "adminuser"
  admin_password      = var.admin_password 
  network_interface_ids = [
    azurerm_network_interface.Liberia.id
  ]

  os_disk {
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }

  source_image_reference {
    publisher = "MicrosoftWindowsServer"
    offer     = "WindowsServer"
    sku       = "2016-Datacenter"
    version   = "latest"
  }
}

resource "azurerm_public_ip" "Liberia" {
  name                = "${var.Environment}-${var.website}-${var.azurerm_public_ip}"
  resource_group_name = "${var.Environment}-${var.website}-${var.azurerm_resource_group}"
  location            = var.location
  allocation_method   = "Static"
  depends_on = [
    azurerm_virtual_network.Liberia
  ]
}