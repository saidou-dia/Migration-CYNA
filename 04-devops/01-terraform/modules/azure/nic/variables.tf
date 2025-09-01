variable "location" {
  description = "Azure location pour les NIC"
  type        = string
}

variable "resource_group" {
  description = "Nom du Resource Group où créer les NIC"
  type        = string
}

variable "subnet_virtualinfra_id" {
  description = "ID du subnet VirtualInfra pour la NIC 1"
  type        = string
}

variable "subnet_users_id" {
  description = "ID du subnet Users pour la NIC 2"
  type        = string
}
