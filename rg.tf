//Creating Resource Groups
    resource "azurerm_resource_group" "rsg" {
    name = "${var.prefix}-3TierArch"
    location = "${var.region}"
    }