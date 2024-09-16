resource "proxmox_vm_qemu" "resource-name" {
  name        = "services"
  target_node = "heimbox"
  iso         = "local:iso/debian-12.4.0-amd64-netinst.iso"
  os_type     = "l26"

  cpu     = "host"
  cores   = var.cores
  sockets = 1

  memory = var.memory
  onboot = true

  scsihw = "virtio-scsi-pci"
  disk {
    type    = "scsi"
    size    = "64G"
    storage = "local-lvm"
  }

  network {
    bridge   = "vmbr0"
    model    = "virtio"
    firewall = true
  }
}
