terraform {
    required_providers {
        proxmox = {
            source = "Telmate/proxmox"
        }
    }
}

provider "proxmox" {
    pm_api_url = var.proxmox_url
    # pm_user = var.proxmox_user
    # pm_password = var.proxmox_password
    pm_api_token_id = "root@pam!terraform2"
    pm_api_token_secret = var.proxmox_api_token_secret

    pm_tls_insecure = true
}