terraform {
  required_providers {
    # See https://registry.terraform.io/providers/Telmate/proxmox
    proxmox = {
      source  = "Telmate/proxmox"
      version = "2.9.14"
    }
  }
}

provider "proxmox" {
  pm_api_token_id     = var.pm_api_token_id
  pm_api_token_secret = var.pm_api_token_secret
  pm_api_url          = var.pm_api_url

  pm_tls_insecure     = true
}
