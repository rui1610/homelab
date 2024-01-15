variable "docker_host" {
    type = string
    description = "The docker host"
    default     = "unix:///var/run/docker.sock"
}

variable "container_name" {
    type = string
    description = "The name of the container"
    default     = "homer"
}

variable "port_container" {
    type = string
    description = "Port used in the container"
    default     = "8080"
}

variable "port_host" {
    type = string
    description = "Port used on the host (and mapped to the container port)"
    default     = "8080"
}

variable "host_path_for_data" {
    type = string
    description = "The host path for data"
    default     = "/Users/D045023/container/homer/data"
}

# checkout the user in the docker container with: id $user
# take the uid (PUID) and the gid (PGID) from your user and add it below
variable "puid" {    
    type = string
    description = "The user id"
    default     = "501"
}
variable "pgid" { 
    type = string
    description = "The group id"
    default     = "20"
}

variable "timezone" {
    type = string
    description = "The timezone"
    default     = "Europe/Berlin"
}
