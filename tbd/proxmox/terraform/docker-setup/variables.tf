variable "host_path_root" {
  type = string
  description = "The root path for all media"
  default     = "/media"

}

variable "host_path_videos_recorder" {
  type = string
  description = "The path to the video recorder folder"
  default     = "/recorder"
}

variable "host_path_movies" {
  type = string
  description = "The path to the movies folder"
  default     = "/movies"
}

variable "host_path_pictures" {
  type = string
  description = "The path to the pictures folder"
  default     = "/bilder"
}

variable "host_path_container_data" {
  type = string
  description = "The path to the container data folder"
  default     = "/daten/docker-data"
}

variable "default_password" {
  type = string
  description = "The default password"
  default     = "password"  
}

variable "docker_host" {
    type = string
    description = "The docker host"
    default     = "unix:///var/run/docker.sock"
}

variable "timezone" {
    type = string
    description = "The timezone"
    default     = "Europe/Berlin"
}

# checkout the user in the docker container with: id $user
# take the uid (PUID) and the gid (PGID) from your user and add it below
variable "puid" {    
    type = string
    description = "The user id"
    default     = "1000"
}
variable "pgid" { 
    type = string
    description = "The group id"
    default     = "1000"
}
