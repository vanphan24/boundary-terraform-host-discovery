variable "azure_subscription" {
  description = "My azure subscription"
  type        = string
  default     = "123456-3d8b-478b-9823-1c3a012345678" # CHANGE VALUE TO MATCH YOUR AZURE SUB
}


# YOUR BOUNDARY INFO #

variable "boundary_addr" {
  description = "boundary cluster address"
  type        = string
  default     = "https://7a677e2c-ed79-4ff1-b760-12345678.boundary.hashicorp.cloud/" # CHANGE VALUE TO MATCH YOUR CLUSTER
}

variable "boundary_scope_id" {
  description = "Project scope for new host catalog"
  type        = string
  default     = "p_mbp123456" # CHANGE VALUE TO MATCH YOUR SCOPE
}

variable "boundary_auth_method_id" {
  description = "boundary auth method ID"
  type        = string
  default     = "ampw_SBZ123456" # CHANGE VALUE TO MATCH YOUR AUTH METHOD ID
  sensitive = true
}


variable "boundary_login_name" {
  description = "boundary username"
  type        = string
  default     = "my-admin-username" # CHANGE VALUE TO MATCH YOUR LOGIN
  sensitive = true
}

variable "boundary_password" {
  description = "boundary password"
  type        = string
  default     = "my-password-1234" # CHANGE VALUE TO MATCH YOUR PASSWORD. OR ENTER PASSWORD ON COMMAND LINE WITH -var FLAG
  sensitive = true
}
