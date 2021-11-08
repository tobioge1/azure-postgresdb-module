variable "resource_group_name" {
  type = string
}


variable "location" {
  type = string
  description = "The Azure location where to create the resource"
  default = "eastus2"
}

variable "start_ip_address" {
  type = string
}

variable "end_ip_address" {
  type = string
}

variable "environment" {
  type = string
  description = "The environment to create resources in"
}


variable "admin_login" {
  type = string
}

variable "admin_login_password" {
  type = string
  sensitive   = true
}

variable "charset" {
  type = string
  default = "UTF8"
}

variable "collation" {
  type = string
  default = "en_US.UTF-8"
}

variable "server_version" {
  type    = string
  default = "13.3"
}

variable "sku_name" {
  type = string
  default = "B_Gen5_2"
}


variable "identifier" {
  type = string
  description = "resource idenifier"
}

variable "database_name" {
  type = string
  description = "name of the database to be created"
}

variable "tags" {
  type = map(string)
  default = {
    "created_By"  = "terraform"
    "deployed_By" = "terraform"
    "product"     = ""
    "shared"      = ""
    "project"     = ""
  }
}