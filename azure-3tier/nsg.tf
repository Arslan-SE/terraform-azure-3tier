//NSG Web
            resource "azurerm_network_security_group" "TerraformrsgNSGWeb" {
            name                = "${var.prefix}-NSG-Web"
            location            = "${azurerm_resource_group.rsg.location}"
            resource_group_name = "${azurerm_resource_group.rsg.name}"

                security_rule {
                    name                       = "Test-Inbound"
                    priority                   = 100
                    direction                  = "Inbound"
                    access                     = "Allow"
                    protocol                   = "*"
                    source_port_range          = "*"
                    destination_port_range     = "*"
                    source_address_prefix      = "*"
                    destination_address_prefix = "*"
                    }
                security_rule {
                    name                       = "Test-Outbound"
                    priority                   = 100
                    direction                  = "outbound"
                    access                     = "Allow"
                    protocol                   = "*"
                    source_port_range          = "*"
                    destination_port_range     = "*"
                    source_address_prefix      = "*"
                    destination_address_prefix = "*"
                    }
            }
            /*
            resource "azurerm_subnet_network_security_group_association" "TerraformrsgNSGWeb-Assosiation" {
                subnet_id                 = "${azurerm_subnet.TerraformSubnetWeb.id}"
                network_security_group_id = "${azurerm_network_security_group.TerraformrsgNSGWeb.id}"
            }
            */
//NSG App
            resource "azurerm_network_security_group" "TerraformrsgNSGApp" {
            name                = "${var.prefix}-NSG-App"
            location            = "${azurerm_resource_group.rsg.location}"
            resource_group_name = "${azurerm_resource_group.rsg.name}"

                security_rule {
                    name                       = "Test-Inbound"
                    priority                   = 100
                    direction                  = "Inbound"
                    access                     = "Allow"
                    protocol                   = "*"
                    source_port_range          = "*"
                    destination_port_range     = "*"
                    source_address_prefix      = "*"
                    destination_address_prefix = "*"
                    }
                security_rule {
                    name                       = "Test-Outbound"
                    priority                   = 100
                    direction                  = "outbound"
                    access                     = "Allow"
                    protocol                   = "*"
                    source_port_range          = "*"
                    destination_port_range     = "*"
                    source_address_prefix      = "*"
                    destination_address_prefix = "*"
                    }
            }
            /*
            resource "azurerm_subnet_network_security_group_association" "TerraformrsgNSGApp-Assosiation" {
                subnet_id                 = "${azurerm_subnet.TerraformSubnetApp.id}"
                network_security_group_id = "${azurerm_network_security_group.TerraformrsgNSGApp.id}"
            }
            */
//NSG DB
            resource "azurerm_network_security_group" "TerraformrsgNSGDB" {
            name                = "${var.prefix}-NSG-DB"
            location            = "${azurerm_resource_group.rsg.location}"
            resource_group_name = "${azurerm_resource_group.rsg.name}"

                security_rule {
                    name                       = "Test-Inbound"
                    priority                   = 100
                    direction                  = "Inbound"
                    access                     = "Allow"
                    protocol                   = "*"
                    source_port_range          = "*"
                    destination_port_range     = "*"
                    source_address_prefix      = "*"
                    destination_address_prefix = "*"
                    }
                security_rule {
                    name                       = "Test-Outbound"
                    priority                   = 100
                    direction                  = "outbound"
                    access                     = "Allow"
                    protocol                   = "*"
                    source_port_range          = "*"
                    destination_port_range     = "*"
                    source_address_prefix      = "*"
                    destination_address_prefix = "*"
                    }
            }
            /*
            resource "azurerm_subnet_network_security_group_association" "TerraformrsgNSGDMZ-Assosiation" {
                subnet_id                 = "${azurerm_subnet.TerraformSubnetDB.id}"
                network_security_group_id = "${azurerm_network_security_group.TerraformrsgNSGDB.id}"
            }
            */