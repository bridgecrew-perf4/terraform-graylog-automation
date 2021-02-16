module "graylog_capability" {
  source        = "../core"

  api_endpoint  = "http://localhost:9000/api"
  auth_method   = "token"
  session_token = "1o8oqq9qv00sf6elj42rejfger9fvfr5uvkel6aamufcer1p91b6"
  
}