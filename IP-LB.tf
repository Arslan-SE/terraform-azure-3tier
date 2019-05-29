//LoadBalancer Web
resource "azurerm_public_ip" "LoadBalancerPublicIP" {
  name                = "${var.prefix}-PublicIPForLB"
  location            = "${azurerm_resource_group.rsg.location}"
  resource_group_name = "${azurerm_resource_group.rsg.name}"
  # public_ip_address_allocation = "static"
  allocation_method   = "Static"
}

resource "azurerm_lb" "LoadBalancerWeb" {
  name                = "${var.prefix}-WebLoadBalancer"
  location            = "${azurerm_resource_group.rsg.location}"
  resource_group_name = "${azurerm_resource_group.rsg.name}"

  frontend_ip_configuration {
    name                 = "Web-PublicFacing"
    public_ip_address_id = "${azurerm_public_ip.LoadBalancerPublicIP.id}"
  }
}
resource "azurerm_lb_rule" "Web-RDP-Rule" {
  resource_group_name            = "${azurerm_resource_group.rsg.name}"
  loadbalancer_id                = "${azurerm_lb.LoadBalancerWeb.id}"
  name                           = "${var.prefix}-LBRule"
  protocol                       = "Tcp"
  frontend_port                  = 3389
  backend_port                   = 3389
  frontend_ip_configuration_name = "Web-PublicFacing"
}
resource "azurerm_lb_backend_address_pool" "Web-LBBackendPool" {
  resource_group_name = "${azurerm_resource_group.rsg.name}"
  loadbalancer_id     = "${azurerm_lb.LoadBalancerWeb.id}"
  name                = "${var.prefix}-Web-BackEndAddressPool"
}

// LoadBalancer - App
resource "azurerm_lb" "LoadBalancerApp" {
  name                = "${var.prefix}-AppLoadBalancer"
  location            = "${azurerm_resource_group.rsg.location}"
  resource_group_name = "${azurerm_resource_group.rsg.name}"

  frontend_ip_configuration {
    name                 = "App-SubnetFacing"
    subnet_id = "${azurerm_subnet.TerraformSubnetApp.id}"
  }
}
resource "azurerm_lb_backend_address_pool" "App-LBBackendPool" {
  resource_group_name = "${azurerm_resource_group.rsg.name}"
  loadbalancer_id     = "${azurerm_lb.LoadBalancerApp.id}"
  name                = "${var.prefix}-App-BackEndAddressPool"
}


