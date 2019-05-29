//Web NIC
resource "azurerm_network_interface" "Web-TerraformNIC" {
  name                = "${var.prefix}-WebNic"
  location            = "${azurerm_resource_group.rsg.location}"
  resource_group_name = "${azurerm_resource_group.rsg.name}"

  ip_configuration {
    name                          = "WebNIC-Config"
    subnet_id                     = "${azurerm_subnet.TerraformSubnetWeb.id}"
    private_ip_address_allocation = "dynamic"
    load_balancer_backend_address_pools_ids = ["${azurerm_lb_backend_address_pool.Web-LBBackendPool.id}"]
  }
}
/*
resource "azurerm_network_interface_backend_address_pool_association" "WebLBBackEndNIC" {
  network_interface_id    = "${azurerm_network_interface.Web-TerraformNIC.id}"
  ip_configuration_name   = "WebNIC-Config"
  backend_address_pool_id = "${azurerm_lb_backend_address_pool.Web-LBBackendPool.id}"
}
*/

//Web VM
resource "azurerm_virtual_machine" "TerraformVM" {
  name                  = "${var.prefix}-WebVM1"
  location              = "${azurerm_resource_group.rsg.location}"
  resource_group_name   = "${azurerm_resource_group.rsg.name}"
  network_interface_ids = ["${azurerm_network_interface.Web-TerraformNIC.id}"]
  //primary_network_interface_id = "${azurerm_network_interface.Web-TerraformNIC.id}"
  vm_size               = "Standard_D64s_v3"

  // comment this line to delete the OS disk automatically when deleting the VM
  delete_os_disk_on_termination = true
  // Uncomment this line to delete the data disks automatically when deleting the VM
  delete_data_disks_on_termination = true

  storage_image_reference {
    publisher = "MicrosoftWindowsServer"
    offer     = "WindowsServer"
    sku       = "2016-Datacenter"
    version   = "latest"
  }

  storage_os_disk {
    name              = "myosdiskWeb"
    caching           = "ReadWrite"
    create_option     = "FromImage"
    managed_disk_type = "Standard_LRS"
  }

  os_profile {
    computer_name  = "WebServer"
    admin_username = "testadmin"
    admin_password = "Password1234!"
  }

  os_profile_windows_config {
    enable_automatic_upgrades = false
    provision_vm_agent = true
  }
}

//App NIC
resource "azurerm_network_interface" "App-TerraformNIC" {
  name                = "${var.prefix}-AppNic"
  location            = "${azurerm_resource_group.rsg.location}"
  resource_group_name = "${azurerm_resource_group.rsg.name}"

  ip_configuration {
    name                          = "AppNIC-Config"
    subnet_id                     = "${azurerm_subnet.TerraformSubnetApp.id}"
    private_ip_address_allocation = "dynamic"
    load_balancer_backend_address_pools_ids = ["${azurerm_lb_backend_address_pool.App-LBBackendPool.id}"]
  }
}
/*
resource "azurerm_network_interface_backend_address_pool_association" "AppLBBackEndNIC" {
  network_interface_id    = "${azurerm_network_interface.App-TerraformNIC.id}"
  ip_configuration_name   = "AppNIC-Config"
  backend_address_pool_id = "${azurerm_lb_backend_address_pool.App-LBBackendPool.id}"
}
*/

//App VM
resource "azurerm_virtual_machine" "App-TerraformVM" {
  name                  = "${var.prefix}-AppVM1"
  location              = "${azurerm_resource_group.rsg.location}"
  resource_group_name   = "${azurerm_resource_group.rsg.name}"
  network_interface_ids = ["${azurerm_network_interface.App-TerraformNIC.id}"]
  //primary_network_interface_id = "${azurerm_network_interface.Web-TerraformNIC.id}"
  vm_size               = "Standard_D32s_v3"

  // comment this line to delete the OS disk automatically when deleting the VM
  delete_os_disk_on_termination = true
  // Uncomment this line to delete the data disks automatically when deleting the VM
  delete_data_disks_on_termination = true

  storage_image_reference {
    publisher = "MicrosoftWindowsServer"
    offer     = "WindowsServer"
    sku       = "2016-Datacenter"
    version   = "latest"
  }

  storage_os_disk {
    name              = "myosdiskApp"
    caching           = "ReadWrite"
    create_option     = "FromImage"
    managed_disk_type = "Standard_LRS"
  }

  os_profile {
    computer_name  = "AppServer"
    admin_username = "testadmin"
    admin_password = "Password1234!"
  }

  os_profile_windows_config {
    enable_automatic_upgrades = false
    provision_vm_agent = true
  }
}



