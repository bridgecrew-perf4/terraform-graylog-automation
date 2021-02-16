terraform {
    required_version    = "0.14.6"
    
    required_providers {
        graylog = {
            source      = "terraform-provider-graylog/graylog"
            version     = "1.0.4"
        }
    }
}