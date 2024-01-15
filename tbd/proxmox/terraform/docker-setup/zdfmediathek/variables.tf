variable "docker_host" {
    type = string
    description = "The docker host"
    default     = "unix:///var/run/docker.sock"
}

variable "port_container" {
    type = string
    description = "Port used in the container"
    default     = "5800"
}

variable "port_host" {
    type = string
    description = "Port used on the host (and mapped to the container port)"
    default     = "5800"
}

variable "host_path_for_downloads" {
    type = string
    description = "The host path for downloads"
    default     = "/Users/D045023/container/media/zdfmediathek"
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
