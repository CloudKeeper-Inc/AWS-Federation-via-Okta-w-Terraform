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

# Add API Token and Okta Org Name here 

provider "okta" {
  org_name        = "trial-xxxx"
  base_url        = "okta.com"
  api_token       = "xxxx"
  request_timeout = 30
}