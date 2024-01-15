resource "docker_image" "jellyfin" {
  name         = "linuxserver/jellyfin:10.7.7"
  keep_locally = false
}

resource "docker_container" "jellyfin" {
  image    = docker_image.jellyfin.image_id
  name     = "jellyfin"
  hostname = "jellyfin"
  env      = ["GID=${var.pgid}", "UID=${var.puid}", "VERSION=docker", "TZ=${var.timezone}"]
  ports {
    internal = var.port_container
    external = var.port_host
  }
  volumes {
    container_path = "/media/movies"
    host_path      = var.host_path_for_movies
  }
  volumes {
    container_path = "/media/tvshows"
    host_path      = var.host_path_for_tvshows
  }
  volumes {
    container_path = "/media/tvrecorder"
    host_path      = var.host_path_for_tvrecordings
  }
  volumes {
    container_path = "/media/family_videos"
    host_path      = var.host_path_for_family_videos
  }
  volumes {
    container_path = "/config"
    host_path      = var.host_path_for_config_files
  }
  restart = "always"
}
