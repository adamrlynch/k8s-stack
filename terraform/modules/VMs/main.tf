resource "proxmox_vm_qemu" "proxmox_vm" {
  count = var.proxmox_vm_count

  name        = "${var.proxmox_vm_name_prefix}-${format("%02d", count.index + 1)}"
  target_node = "proxmox-${format("%02d", count.index + 1)}"

  clone      = var.proxmox_clone_template
  full_clone = true

  ipconfig0 = "ip=${cidrhost(var.proxmox_start_ip_address, count.index + 1)}/8,gw=${cidrhost(var.proxmox_ip_gw, 1)}"

  scsihw = "virtio-scsi-pci"

  ciuser = "adam"
  sshkeys = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQCpb9DfFAcTy1M9dk4ThwVjGQISkMAI3xQMnptSzKCsdp5yC4x/drcSTrHTXLXEIj79f3XySQb4vB4KnLQ/dxJb4d6FT3buABso+xlpVMATrWQ6DOROqmpkIXQ1AqfYMO7Nqsfgqk2FQpIC6MyguoG126KT+t5ROI+iNdF3HJ9mXuOGoa2whaL2r0bjug4KbdZOPjBlMnoFbCdK1+/ZkXtCTtI3lhGIzRtHi3PBMZf/f1mPCI6Z9entx1+jv36yzL4awPk0fjaykuqgzAedHNLBnPWTOKvMfF9xyDOuu3qN+w/oIZwZCe93A+/KzHYAHkuHf63+iK0khmli029pgBx1 alynch@BRK-203217"

  disks {
      ide {
        ide2 {
          cloudinit {
            storage = "vm-disks"
          }
        }
      }
      scsi {
        scsi0 {
          disk {
            size = "32G"
            storage = "vm-disks"
          }
        }
      }
  }

  network {
    model = "virtio"
    bridge = "vmbr0"
  }

  cores  = var.cores
  memory = var.memory

  onboot = true
}

output "VMs" {
  value = {
    for vm in proxmox_vm_qemu.proxmox_vm : vm.name => {
      ip = vm.default_ipv4_address
      user = vm.ciuser
      sshKey = vm.sshkeys
    }
  }
}