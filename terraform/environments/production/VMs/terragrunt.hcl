include "root" {
  path = find_in_parent_folders()
}

locals {
  root = read_terragrunt_config(find_in_parent_folders())
}

terraform {
  source = "${get_repo_root()}//terraform/modules/VMs"
}

inputs = { 
    proxmox_vm_count         = 4
    proxmox_vm_name_prefix   = "k3s"
    proxmox_clone_template   = "ubuntu-cloud-24-04"
    proxmox_start_ip_address = "10.2.0.0/16"
    proxmox_ip_gw            = "10.0.0.1/8"
    cores                    = 4
    memory                   = 8192
    proxmox_url              = local.root.locals.proxmox_api_url
    proxmox_token_id         = local.root.locals.proxmox_api_token_id
    proxmox_token_secret     = local.root.locals.proxmox_api_token_secret
    }