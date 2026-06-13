variable "subscription_id" {
  description = "Azure Subscription ID."
  type        = string
  default     = "39278b85-11c4-4930-a807-1b65a592d48f"
}

variable "resource_group_name" {
  description = "Name of the Azure Resource Group. It includes the project owner's name."
  type        = string
  default     = "rg-diefallah-cloudscale-project"
}

variable "location" {
  description = "Azure region where all resources will be created."
  type        = string
  default     = "switzerlandnorth"
}

variable "project_name" {
  description = "Project name used for naming Azure resources."
  type        = string
  default     = "cloudscale"
}

variable "environment" {
  description = "Deployment environment name."
  type        = string
  default     = "production"
}

variable "owner_name" {
  description = "Owner name used in resource tags."
  type        = string
  default     = "Dief allah Ateeyah"
}

variable "admin_username" {
  description = "Admin username for the Linux virtual machine."
  type        = string
  default     = "azureuser"
}

variable "admin_password" {
  description = "Admin password for the Linux virtual machine."
  type        = string
  sensitive   = true
}

variable "docker_image_name" {
  description = "Docker image that will run on the Azure VM."
  type        = string
  default     = "diefallah6/cloudscale-webapp:v1"
}