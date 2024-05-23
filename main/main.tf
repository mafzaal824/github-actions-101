##################################################################################
# DATA
##################################################################################

data "azurerm_resource_group" "rg" {
  name = "afzaal-temp"
}

##################################################################################
# LOCALS
##################################################################################


locals {
  app_service_plan_name = "${var.naming_prefix}-${random_integer.name_suffix.result}"
  app_service_name = "${var.naming_prefix}-${random_integer.name_suffix.result}"
}

resource "random_integer" "name_suffix" {
  min = 10000
  max = 99999
}

##################################################################################
# APP SERVICE
##################################################################################

resource "azurerm_app_service_plan" "app_service" {
  name                = local.app_service_plan_name
  location            = var.location
  resource_group_name = data.azurerm_resource_group.rg.name

  sku {
    tier = var.asp_tier
    size = var.asp_size
    capacity = var.capacity
  }
}

resource "azurerm_app_service" "app_service" {
  name                = local.app_service_name
  location            = var.location
  resource_group_name = data.azurerm_resource_group.rg.name
  app_service_plan_id = azurerm_app_service_plan.app_service.id
  
  source_control {
    repo_url = "https://github.com/ned1313/nodejs-docs-hello-world"
    branch = "main"
    manual_integration = true
    use_mercurial = false
  }
}
