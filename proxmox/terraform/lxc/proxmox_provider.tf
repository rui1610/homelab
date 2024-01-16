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
  #pm_api_token_id     = var.pm_api_token_id
  #pm_api_token_secret = var.pm_api_token_secret
  pm_user     = var.pm_user
  pm_password = var.pm_password
  pm_api_url  = join("",["https://", var.pm_ip_address ,":", var.pm_port, "/api2/json"])

  pm_tls_insecure = true
}
