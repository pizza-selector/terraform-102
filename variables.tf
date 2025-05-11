variable "environment" {
  type        = string
  default     = "dev"
  description = "environment name"

  validation {
    condition     = contains(["dev", "prod"], var.environment)
    error_message = "Environment can be one of 'dev' or 'prod'"
  }
}
