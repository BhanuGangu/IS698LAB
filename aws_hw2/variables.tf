# Global
variable "env" {
  description = "Environment (dev/stage/prod)"
  type        = string
  default     = "dev"
}

variable "region" {
  description = "AWS region"
  type        = string
  default     = "us-east-1"
}

# Networking
variable "vpc_cidr" {
  description = "VPC CIDR block"
  type        = string
  default     = "10.0.0.0/16"
}

variable "public_subnets" {
  description = "Public subnet CIDRs"
  type        = list(string)
  default     = ["10.0.1.0/24", "10.0.2.0/24"]
}

variable "private_subnets" {
  description = "Private subnet CIDRs"
  type        = list(string)
  default     = ["10.0.3.0/24", "10.0.4.0/24"]
}

# Compute
variable "key_name" {
  description = "SSH key pair name"
  type        = string
}

# Storage
variable "bucket_name" {
  description = "S3 bucket base name"
  type        = string
  default     = "webapp-bucket"
}

# Database
variable "table_name" {
  description = "DynamoDB table base name"
  type        = string
  default     = "users"
}
