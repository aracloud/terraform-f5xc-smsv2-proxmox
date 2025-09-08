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

provider "proxmox" {
        pm_api_url= var.proxmox_api_url
        pm_api_token_id = var.proxmox_api_token_id
        pm_api_token_secret = var.proxmox_api_token_secret
        pm_tls_insecure = true
}
