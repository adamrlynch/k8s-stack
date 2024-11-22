generate "backend" {
  path      = "backend.tf"
  if_exists = "overwrite_terragrunt"
  contents  = <<EOF
backend "remote" {
  hostname     = "app.terraform.io"
  organization = "WRSYS"
  workspaces   = {
    name = "main"
  }
}
EOF
}