//subnet Web
        resource "azurerm_subnet" "TerraformSubnetWeb" {
            name = "${var.prefix}-Subnet-Web"
            resource_group_name = "${azurerm_resource_group.rsg.name}"
            virtual_network_name = "${azurerm_virtual_network.TerraformVNET.name}"
            address_prefix = "10.0.1.0/24"
            network_security_group_id = "${azurerm_network_security_group.TerraformrsgNSGWeb.id}"
        }
//subnet App
        resource "azurerm_subnet" "TerraformSubnetApp" {
            name = "${var.prefix}-Subnet-App"
            resource_group_name = "${azurerm_resource_group.rsg.name}"
            virtual_network_name = "${azurerm_virtual_network.TerraformVNET.name}"
            address_prefix = "10.0.2.0/24"
            network_security_group_id = "${azurerm_network_security_group.TerraformrsgNSGApp.id}"
        }
//subnet DB
        resource "azurerm_subnet" "TerraformSubnetDB" {
            name = "${var.prefix}-Subnet-DB"
            resource_group_name = "${azurerm_resource_group.rsg.name}"
            virtual_network_name = "${azurerm_virtual_network.TerraformVNET.name}"
            address_prefix = "10.0.3.0/24"
            network_security_group_id = "${azurerm_network_security_group.TerraformrsgNSGDB.id}"
        }