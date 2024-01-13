variable "resource_group_name" {
  description = "The name of the resource group"
  type = string
}

variable "apiManagementServiceName" {
  description = "The name of the API Management service instance"
  type        = string
}

variable "publisherEmail" {
  description = "The email address of the owner of the service"
  type        = string
}

variable "publisherName" {
  description = "The name of the owner of the service"
  type        = string
}

variable "sku" {
  description = "The pricing tier of this API Management service"
  type        = string
}

variable "skuCount" {
  description = "The instance size of this API Management service."
  type        = number
}

variable "location" {
  description = "Location for all resources."
  type        = string
}

variable "aoaiPrimaryAccount" {
  type = string
}

variable "aoaiSecondaryAccount" {
  type = string
}

variable "aoaiPrimaryLLMDeployment" {
  type = string
}

variable "aoaiSecondaryLLMDeployment" {
  type = string
}
