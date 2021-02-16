module "graylog_capability" {
  source        = "../core"

  api_endpoint  = "http://localhost:9000/api"
  auth_method   = "token"
  token = var.api_token
  
}

variable "api_token" {
  description   = "Temporary token for API access."
}