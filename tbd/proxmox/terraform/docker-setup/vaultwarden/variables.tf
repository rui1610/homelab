variable "docker_host" {
    type = string
    description = "The docker host"
    default     = "unix:///var/run/docker.sock"
}

variable "port_container" {
    type = string
    description = "Port used in the container"
    default     = "80"
}

variable "port_host" {
    type = string
    description = "Port used on the host (and mapped to the container port)"
    default     = "8082"
}

variable "host_path_for_data" {
    type = string
    description = "The host path for data"
    default     = "/Users/D045023/container/vaultwarden/data"
}

variable "timezone" {
    type = string
    description = "The timezone"
    default     = "Europe/Berlin"
}
