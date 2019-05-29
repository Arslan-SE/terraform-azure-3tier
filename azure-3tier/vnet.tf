//Create Virtual Networks and subnet
    resource "azurerm_virtual_network" "TerraformVNET" {
    name = "${var.prefix}-HUBVNET"
    address_space = ["10.0.0.0/16"]
    location = "${azurerm_resource_group.rsg.location}"
    resource_group_name = "${azurerm_resource_group.rsg.name}"
    //dns_servers = ["10.215.12.18"]
    //dns_servers = ["10.136.255.140"]
    }