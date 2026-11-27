variable "project_name" {
  type        = string
  default     = "demo"

  validation {
    condition     = can(regex("^[a-z0-9]{2,12}$", var.project_name))
    error_message = "project_name must be 2-12 lowercase alphanumeric characters."
  }
}

variable "environment" {
  type        = string
  default     = "dev"

  validation {
    condition     = contains(["dev", "staging", "prod"], var.environment)
    error_message = "environment must be one of: dev, staging, prod."
  }
}

variable "location" {
  type        = string
  default     = "eastus"
}

variable "tags" {
  type        = map(string)
  default = {
    managed_by = "terraform"
  }
}
