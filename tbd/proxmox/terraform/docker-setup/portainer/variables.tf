variable "docker_host" {
    type = string
    description = "The docker host"
    default     = "unix:///var/run/docker.sock"
}

variable "docker_sock" {
    type = string
    description = "The docker host"
    default     = "/var/run/docker.sock"
}

variable "host_path_data" { 
    type = string
    description = "The host path with the tv recording files"
    default     = "/Users/D045023/container/portainer/data"
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

variable "host_port_8000" {  
    type = string
    description = "The port used on the host for container port 8000"
    default     = "8000"
}

variable "host_port_9000" {  
    type = string
    description = "The port used on the host for container port 9000"
    default     = "9000"
}

variable "timezone" {
    type = string
    description = "The timezone"
    default     = "Europe/Berlin"
}
