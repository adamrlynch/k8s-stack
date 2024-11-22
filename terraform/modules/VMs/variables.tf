variable "proxmox_url" {
  description = "The URL of the Proxmox API"
  type        = string
}

variable "proxmox_token_id" {
  description = "The Proxmox API token ID"
  type        = string
}

variable "proxmox_token_secret" {
  description = "The Proxmox API token secret"
  type        = string
}

variable "proxmox_vm_count" {
  description = "The number of VMs to create"
  type        = number
}

variable "proxmox_vm_name_prefix" {
  description = "The prefix to use for the VM names"
  type        = string
}

variable "proxmox_clone_template" {
  description = "The name of the template to clone"
  type        = string
}

variable "cores" {
  description = "The number of CPU cores to allocate to each VM"
  type        = number  
}

variable "memory" {
  description = "The amount of memory to allocate to each VM"
  type        = number  
}

variable "proxmox_start_ip_address" {
  description = "The starting IP address for the VMs"
  type        = string  
}

variable "proxmox_ip_gw" {
  description = "The IP address of the gateway"
  type        = string  
}