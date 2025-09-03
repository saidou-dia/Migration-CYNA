# Azure Credentials
variable "subscription_id" {}
variable "tenant_id" {}
variable "client_id" {}
variable "client_secret" {}

# Général
variable "location" {}
variable "resource_group" {}

# VNETs et subnets
variable "vnets" {
  description = "Map des VNETs et leurs subnets"
  type = map(any)
}

variable "vms" {
  description = "Map des VMs à créer"
  type        = map(any)
  default     = {}   # ou mettre ton local.vms ici
}
