# Virtual Network, Subnets and Subnet NSG's

## Virtual Network
variable "vnet_name" {
  description = "Virtual Network name"
  type        = string
  default     = "vnet-default"
}
variable "vnet_address_space" {
  description = "Virtual Network address_space"
  type        = list(string)
  default     = ["10.0.0.0/16"]
}

# Wordpress Subnet Name
variable "wordpress_subnet_name" {
  description = "Virtual Network wordpress Subnet Name"
  type        = string
  default     = "wordpress_subnet"
}
# Wordpress Subnet Address Space
variable "wordpress_subnet_address" {
  description = "Virtual Network wordpress Subnet Address Spaces"
  type        = list(string)
  default     = ["10.0.1.0/24"]
}


# App Subnet Name
variable "app_subnet_name" {
  description = "Virtual Network App Subnet Name"
  type        = string
  default     = "appsubnet"
}
# App Subnet Address Space
variable "app_subnet_address" {
  description = "Virtual Network App Subnet Address Spaces"
  type        = list(string)
  default     = ["10.0.11.0/24"]
}


# Database Subnet Name
variable "db_subnet_name" {
  description = "Virtual Network Database Subnet Name"
  type        = string
  default     = "dbsubnet"
}
# Database Subnet Address Space
variable "db_subnet_address" {
  description = "Virtual Network Database Subnet Address Spaces"
  type        = list(string)
  default     = ["10.0.21.0/24"]
}



