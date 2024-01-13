provider "azurerm" {
  features {}
}


resource "random_string" "random" {
  length  = 16
  special = true
  override_special = "/@£$"
}


resource "azurerm_api_management" "apiManagementService" {
  name                = var.apiManagementServiceName
  resource_group_name = "messana-rg"
  location            = var.location
  publisher_email     = var.publisherEmail
  publisher_name      = var.publisherName
  sku_name            = "${var.sku}_${var.skuCount}"
}

resource "azurerm_api_management_backend" "primarybackend" {
  name                = "primary"
  api_management_name = azurerm_api_management.apiManagementService.name
  resource_group_name = "messana-rg"

  protocol            = "http"
  url                 = "https://${var.aoaiPrimaryAccount}.openai.azure.com/openai/deployments/${var.aoaiPrimaryLLMDeployment}"
  description         = "Primary LLM deployment endpoint"
}

resource "azurerm_api_management_backend" "secondarybackend" {
  name                = "secondary"
  api_management_name = azurerm_api_management.apiManagementService.name
  resource_group_name = "messana-rg"

  protocol            = "http"
  url                 = "https://${var.aoaiSecondaryAccount}.openai.azure.com/openai/deployments/${var.aoaiSecondaryLLMDeployment}"
  description         = "Secondary LLM deployment endpoint"
}

resource "azurerm_api_management_api" "api" {
  name                = "CompletionsAPI"
  api_management_name = azurerm_api_management.apiManagementService.name
  resource_group_name = "messana-rg"
  revision            = "1"

  // Additional properties will be required here
}
