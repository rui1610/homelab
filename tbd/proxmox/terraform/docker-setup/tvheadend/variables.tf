variable "docker_host" {
    type = string
    description = "The docker host"
    default     = "unix:///var/run/docker.sock"
}

variable "host_path_for_tvrecordings" { 
    type = string
    description = "The host path with the tv recording files"
    default     = "/Users/D045023/container/media/tvrecordings"
}


variable "host_path_for_config_files" { 
    type = string
    description = "The host path with all config files (can become quite large)"
    default     = "/Users/D045023/container/data/tvheadend"
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

variable "host_port_ui" {  
    type = string
    description = "The port used on the host for container port 9981"
    default     = "9981"
}

variable "timezone" {
    type = string
    description = "The timezone"
    default     = "Europe/Berlin"
}
