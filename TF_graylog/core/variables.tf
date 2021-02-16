variable "api_endpoint" {
  type        = string
  description = "Graylog endpoint"
}

variable "token" {
  type        = string
  description = "Graylog token"
}

variable "auth_method" {
  type        = string
  description = "Graylog 'token' or 'session' method for API access"
  validation {
    condition     = var.auth_method == "token" || var.auth_method == "session"
    error_message = "The auth_method must be either 'token' or 'session'."
  }
}