variable "subscription_id" {
  description = "ID de l'abonnement Azure"
  type        = string
}

variable "tenant_id" {
  description = "ID du tenant Azure"
  type        = string
}

variable "client_id" {
  description = "Client ID de l'application/service principal"
  type        = string
}

variable "client_secret" {
  description = "Client Secret de l'application/service principal"
  type        = string
}

variable "location" {
  description = "Azure region"
  type        = string
}

variable "resource_group" {
  description = "Nom du Resource Group principal"
  type        = string
}

variable "vnets" {
  description = "Map des VNETs et subnets"
  type        = map(any)
}
