variable "proxmox_url" {
    type = string
    default = "https://192.168.2.2:8006/api2/json"
    nullable = false
}

variable "proxmox_user" {
    type = string
    default = "root@pam"
    nullable = false
}

variable "proxmox_password" {
    type = string
    default = ""
}

variable "vm_name" {
    type = string
    default = "youritguyvm"
    nullable = false
}

variable "target_node" {
    type = string
    default = "microbito"
    nullable = false
}

variable "qemu_os" {
    type = string
    default = "l26"
    nullable = false
}

variable "os_type" {
    type = string
    default = "centos"
    nullable = false
}

variable "iso" {
    type = string
    default = "local:iso/Centos7_Minimal.iso"
    nullable = false
}

variable "cores" {
    type = number
    default = 1
    nullable = false
}

variable "sockets" {
    type = number
    default = 1
    nullable = false
}

variable "memory" {
    type = number
    default = 1024
    nullable = false
}

variable "disk_type" {
    type = string
    default = "ide"
    nullable = false
}

variable "disk_storage" {
    type = string
    default = "local-lvm"
    nullable = false
}

variable "disk_size" {
    type = string
    default = "16G"
    nullable = false
}

variable "network_model" {
    type = string
    default = "virtio"
    nullable = false
}

variable "network_bridge" {
    type = string
    default = "vmbr0"
    nullable = false
}