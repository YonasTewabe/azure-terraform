variable "project_name" {
  description = "Short project name used for naming Azure resources."
  type        = string
  default     = "demo"

  validation {
    condition     = can(regex("^[a-z0-9]{2,12}$", var.project_name))
    error_message = "project_name must be 2-12 lowercase alphanumeric characters."
  }
}

variable "environment" {
  description = "Deployment environment (e.g., dev, staging, prod)."
  type        = string
  default     = "dev"

  validation {
    condition     = contains(["dev", "staging", "prod"], var.environment)
    error_message = "environment must be one of: dev, staging, prod."
  }
}

variable "location" {
  description = "Azure region where resources will be created."
  type        = string
  default     = "eastus"
}

variable "vm_size" {
  description = "Azure VM size for the Linux server."
  type        = string
  default     = "Standard_B1s"
}

variable "admin_username" {
  description = "Admin username for SSH access to the Linux VM."
  type        = string
  default     = "azureuser"
}

variable "ssh_public_key" {
  description = "Optional SSH public key string. If null, Terraform generates a key pair."
  type        = string
  default     = null
}

variable "allowed_ssh_cidr" {
  description = "CIDR block allowed to SSH into the VM (restrict to your IP/32 for production)."
  type        = string
  default     = "0.0.0.0/0"
}

variable "tags" {
  description = "Common tags applied to all resources."
  type        = map(string)
  default = {
    managed_by = "terraform"
  }
}
