provider "graylog" {
  web_endpoint_uri = var.api_endpoint
  api_version      = "v3"

  auth_name        = var.session_token
  auth_password    = var.auth_method
}