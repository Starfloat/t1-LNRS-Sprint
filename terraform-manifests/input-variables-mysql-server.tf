variable "mysql_db_name" {
  description = "Azure MySQL Database Name"
  type = string
}

variable "mysql_db_username" {
  description = "Azure MySQL Database Admin Username"
  type = string
}

variable "mysql_db_password" {
  description = "Azure MySQL Database Admin Password"
  type = string
  sensitive = true
}

variable "mysql_db_schema" {
  description = "Azure MySQL Database Schema Name"
  type = string
}