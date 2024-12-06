variable "aws_region" {
  description = "region of my rds database instances"
  type        = string
  default     = "us-east-2" # CHANGE VALUE TO MATCH YOUR REGION
}

variable "boundary_addr" {
  description = "boundary cluster address"
  type        = string
  default     = "https://7a677e2c-ed79-4ff1-b760-708c9b5901e9.boundary.hashicorp.cloud/" # CHANGE VALUE TO MATCH YOUR CLUSTER
}

variable "boundary_scope_id" {
  description = "Scope for new host catalog"
  type        = string
  default     = "p_mbpTEENkKs" # CHANGE VALUE TO MATCH YOUR SCOPE
}

variable "boundary_auth_method_id" {
  description = "boundary auth method ID"
  type        = string
  default     = "ampw_1234567" # CHANGE VALUE TO MATCH YOUR AUTH METHOD ID
  sensitive = true
}


variable "boundary_login_name" {
  description = "boundary username"
  type        = string
  default     = "admin" # CHANGE VALUE TO MATCH YOUR LOGIN
  sensitive = true
}

variable "boundary_password" {
  description = "boundary password"
  type        = string
  default     = "my-password-1234" # CHANGE VALUE TO MATCH YOUR PASSWORD
  sensitive = true
}

