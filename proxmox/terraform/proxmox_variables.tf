variable "timezone" {
    type = string
    description = "The timezone"
    default     = "Europe/Berlin"
}

variable "password_lxc_cnt" {
    type = string
    description = "The password for the lxc container"
    sensitive = true  
}

variable "pm_user" {
    type = string
    description = "The user for the proxmox TF provider, e.g. root@pam"
}
variable "pm_password" {
    type = string
    description = "The password for the proxmox TF provider"
    sensitive = true  
}

variable "pm_ip_address" {
    type = string
    description = "The IP address of the proxmox server"
}
variable "pm_port" {
    type = string
    description = "The port of the proxmox server"
    default = "8006"
}
variable "ip_address_lxc_cnt" {
    type = string
    description = "The ip address for the lxc container"
}

variable "ip_address_gateway" {
    type = string
    description = "The ip address of the gateway"
}

variable "cores" {
    type = number
    description = "The number of cores"
    default     = 1
}

variable "swap" {
    type = number
    description = "The swap size in MB"
    default     = 512
  
}

variable "memory" {
    type = number
    description = "The memory size in MB"
    default     = 512
}