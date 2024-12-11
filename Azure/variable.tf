variable "azure_subscription" {
  description = "My azure subscription"
  type        = string
  default     = "1a2b542d-3d8b-478b-9823-1c3a014c25b4" # CHANGE VALUE TO MATCH YOUR AZURE SUB
}


# YOUR BOUNDARY INFO #

variable "boundary_addr" {
  description = "boundary cluster address"
  type        = string
  default     = "https://7a677e2c-ed79-4ff1-b760-708c9b5901e9.boundary.hashicorp.cloud/" # CHANGE VALUE TO MATCH YOUR CLUSTER
}

variable "boundary_scope_id" {
  description = "Project scope for new host catalog"
  type        = string
  default     = "p_mbpTEENkKs" # CHANGE VALUE TO MATCH YOUR SCOPE
}

variable "boundary_auth_method_id" {
  description = "boundary auth method ID"
  type        = string
  default     = "ampw_SBZ0hG36lW" # CHANGE VALUE TO MATCH YOUR AUTH METHOD ID
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
  default     = "Osmium76!cbs" # CHANGE VALUE TO MATCH YOUR PASSWORD. OR ENTER PASSWORD ON COMMAND LINE WITH -var FLAG
  sensitive = true
}

variable "boundary_password1" {
  description = "boundary password"
  type        = string
  default     = "Osmium76!cbs" # CHANGE VALUE TO MATCH YOUR PASSWORD. OR ENTER PASSWORD ON COMMAND LINE WITH -var FLAG
  sensitive = true
}