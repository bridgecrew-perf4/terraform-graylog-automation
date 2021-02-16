provider "graylog" {
  web_endpoint_uri = var.api_endpoint
  api_version      = "v3"

  auth_name        = var.token
  auth_password    = var.auth_method
}