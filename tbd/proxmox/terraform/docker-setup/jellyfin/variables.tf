variable "docker_host" {
  type        = string
  description = "The docker host"
  default     = "unix:///var/run/docker.sock"
}

variable "port_container" {
  type        = string
  description = "Port used in the container"
  default     = "8096"
}

variable "port_host" {
  type        = string
  description = "Port used on the host (and mapped to the container port)"
  default     = "8096"
}

variable "host_path_for_movies" {
  type        = string
  description = "The host path with the movie files"
  default     = "/Users/D045023/container/media/movies"
}

variable "host_path_for_tvshows" {
  type        = string
  description = "The host path with the tvshow files"
  default     = "/Users/D045023/container/media/tvshows"
}

variable "host_path_for_tvrecordings" {
  type        = string
  description = "The host path with the tv recording files"
  default     = "/Users/D045023/container/media/tvrecordings"
}

variable "host_path_for_youtube_videos" {
  type        = string
  description = "The host path with downloaded youtube files"
  default     = "/Users/D045023/container/media/youtube"
}

variable "host_path_for_family_videos" {
  type        = string
  description = "The host path with family videos"
  default     = "/Users/D045023/container/media/family"
}

variable "host_path_for_config_files" {
  type        = string
  description = "The host path with all config files (can become quite large)"
  default     = "/Users/D045023/container/data/jellyfin/config"
}

# checkout the user in the docker container with: id $user
# take the uid (PUID) and the gid (PGID) from your user and add it below
variable "puid" {
  type        = string
  description = "The user id"
  default     = "501"
}
variable "pgid" {
  type        = string
  description = "The group id"
  default     = "20"
}

variable "timezone" {
  type        = string
  description = "The timezone"
  default     = "Europe/Berlin"
}
