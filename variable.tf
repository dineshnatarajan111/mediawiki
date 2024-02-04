variable "resourcegroup_name" {
  description = ""
  type = string
  default = ""
}

variable "location" {
  description = ""
  type = string
  default = ""
}

variable "environment" {
  description = ""
  type = string
  default = ""
}

variable "network_security_group_name_public" {
  description = ""
  type = string
  default = ""
}

variable "network_security_group_name_private" {
  description = ""
  type = string
  default = ""
}

variable "virtual_network_name" {
  description = ""
  type = string
  default = ""
}

variable "subnet_ilb_name" {
  description = ""
  type = string
  default = ""
}

variable "subnet_blue_name" {
  description = ""
  type = string
  default = ""
}

variable "subnet_green_name" {
  description = ""
  type = string
  default = ""
}

variable "aks_name" {
  description = ""
  type = string
  default = ""
}

variable "aks_vm_size" {
  description = ""
  type = string
  default = ""
}

variable "mssql_server_name" {
  description = ""
  type = string
  default = ""
}

variable "mssql_server_username" {
  description = ""
  type = string
  default = ""
}

variable "mssql_server_password" {
  description = ""
  type = string
  default = ""
}

variable "mssql_db_data" {
  description = ""
  type = list(object({
    name = string
  }))
  default = [ {
    name = ""
  } ]
}