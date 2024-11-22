locals {
    proxmox_api_url        = "https://proxmox.lynch.us.to:8006/api2/json"
    proxmox_api_token_id   = "terraform@pam!terraform"
    proxmox_api_token_secret = get_env("TF_VAR_proxmox_api_token_secret")

}

generate "backend" {
  path      = "backend.tf"
  if_exists = "overwrite_terragrunt"
  contents  = <<EOF
terraform {
    backend "remote" {
        organization = "WRSYS"
        workspaces {
            name = "main"
        }
    }
}
EOF
}