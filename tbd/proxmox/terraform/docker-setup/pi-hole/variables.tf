variable "docker_host" {
    type = string
    description = "The docker host"
    default     = "unix:///var/run/docker.sock"
}

variable "host_path_dnsmasq" {
    type = string
    description = "The host path for dnsmasq"
    default     = "/Users/D045023/container/data/pihole/etc-dnsmasq.d"
}

variable "host_path_pihole" {
    type = string
    description = "The host path for pihole"
    default     = "/Users/D045023/container/data/pihole/etc-pihole"
}

variable "pihole_web_password" {
    type = string
    description = "The password for the pihole web interface"
    default     = "password"
    sensitive   = true
}

variable "host_port_80" {  
    type = string
    description = "The port used on the host for container port 80"
    default     = "80"
}

variable "host_port_53" {  
    type = string
    description = "The port used on the host for container port 53"
    default     = "53"
}

variable "timezone" {
    type = string
    description = "The timezone"
    default     = "Europe/Berlin"
}
