resource "proxmox_lxc" "basic" {
  target_node  = "heimbox"
  hostname     = "services"
  description  = "Basic LXC Container for docker containers"
  ostemplate   = "local:vztmpl/debian-12-standard_12.2-1_amd64.tar.zst"
  password     = var.password_lxc_cnt
  unprivileged = true
  cores        = var.cores
  memory       = var.memory
  swap         = var.swap
  onboot       = true
  start        = true

  // Terraform will crash without rootfs defined
  rootfs {
    storage = "local-lvm"
    size    = "64G"
  }
  # Changing the features can't be done via API Token authentication, but only via username/password
  # https://github.com/bpg/terraform-provider-proxmox/issues/344
  features {
    fuse    = true
    nesting = true
    keyctl  = true
    mount   = "nfs;cifs"
  }

  network {
    name     = "eth0"
    bridge   = "vmbr0"
    ip       = join("", [var.ip_address_lxc_cnt, "/24"])
    gw       = var.ip_address_gateway
    firewall = true
  }
}
