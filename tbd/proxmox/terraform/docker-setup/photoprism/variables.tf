variable "docker_host" {
    type = string
    description = "The docker host"
    default     = "unix:///var/run/docker.sock"
}

variable "port_container" {
    type = string
    description = "Port used in the container"
    default     = "2342"
}

variable "port_host" {
    type = string
    description = "Port used on the host (and mapped to the container port)"
    default     = "2342"
}

variable "host_path_for_downloads" {
    type = string
    description = "The host path for downloads"
    default     = "/Users/D045023/Downloads"
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

variable "host_path_for_mariadb" {
    type = string
    description = "The host path for mariadb"
    default     = "/Users/D045023/container/data/mariadb"
}
variable "db_password" {
    type = string
    description = "The password for the database"
    default     = "photoprism"
    sensitive = true
}

variable "root_password" {
    type = string
    description = "The password for the root user"
    default     = "photoprism"
    sensitive = true
}

variable "host_path_for_pictures" {
    type = string
    description = "The host path for pictures"
    default     = "/Users/D045023/container/media/pictures"
}
variable "host_path_for_storage" {
    type = string
    description = "The host path for storage"
    default     = "/Users/D045023/container/data/photprism"
}