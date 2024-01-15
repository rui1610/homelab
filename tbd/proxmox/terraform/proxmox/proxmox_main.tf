resource "proxmox_vm_qemu" "resource-name" {
  name        = "Temp"
  desc = "Debian server with docker"
  vmid = 200   
  target_node = "heimbox"

  agent = 1

  ### or for a Clone VM operation
  clone = "debian-12-docker"
  cores = 2
  sockets = 1
  cpu = "host"
  memory = 2048

  network {
    model = "virtio"
    bridge = "vmbr0"
  }

  disk {
    size = "64G"
    type = "virtio"
    storage = "local-lvm"
  }

  ### or for a PXE boot VM operation
  # pxe = true 
  # boot = "scsi0;net0"
  # agent = 0
}