terraform {
  required_providers {
    okta = {
      source  = "okta/okta",
      version = "~> 4.8.1"
    }
    aws = {
      source  = "hashicorp/aws",
      version = "~> 5.0"
    }
  }
}


provider "okta" {
  org_name        = "trial-5429295"
  base_url        = "okta.com"
  api_token       = "00b8TImzBtkbTinszkgLM3GqM0LUIxGK089UPGqzKO"
  request_timeout = 30
}