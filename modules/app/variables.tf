variable "environment" {
  type        = string
  default     = "dev"
  description = "environment name"

  validation {
    condition     = contains(["dev", "prod"], var.environment)
    error_message = "Environment can be one of 'dev' or 'prod'"
  }
}

variable "instance_type" {
  type        = string
  default     = "t2.micro"
  description = "instance type for EC2"
}

variable "app_name" {
  type        = string
  description = "Name of the instace"
}