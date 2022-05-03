variable "resource_group_location" {
  description = "Region for the resource group created in Azure"
  type = string
  default = "centralus"
}

variable "resource_group_name" {
  description = "Name of resource group"
  type = string
  default = "lnrs-rg"
}

variable "environment" {
  description = "Environment variable name for prefix"
  type = string
  default = "dev"
}

variable "team" {
  description = "Team variable name for prefix"
  type = string
  default = "team1"
}