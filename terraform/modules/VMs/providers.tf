terraform {
  required_providers {
    proxmox = {
      source = "telmate/proxmox"
      version = "3.0.1-rc4"
    }
  }
}
provider "proxmox" {
  pm_api_url          = var.proxmox_url
  pm_api_token_id     = var.proxmox_token_id
  pm_api_token_secret = var.proxmox_token_secret
  pm_tls_insecure     = true
  pm_parallel         = 1
}