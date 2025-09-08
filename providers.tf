terraform {
  required_version = ">=0.12"

  required_providers {
    random = {
      source  = "hashicorp/random"
      version = "~>3.0"
    }
    volterra = {
      source = "volterraedge/volterra"
      version = ">=0.0.6"
    }
    proxmox = {
      source  = "telmate/proxmox"
      version = "~> 2.9.14"
    }
  }
}



provider "volterra" {
  // api_p12_file = var.f5xc_api_p12_file
  // url          = var.f5xc_api_url
  // alias        = "default"
}

