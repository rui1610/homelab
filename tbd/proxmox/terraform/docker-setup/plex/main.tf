resource "docker_image" "plex" {
  name         = "linuxserver/plex:latest"
  keep_locally = false
}

resource "docker_container" "plex" {
  image        = docker_image.plex.image_id
  name         = "plex"
  hostname     = "plex"
  network_mode = "host"
  env          = ["GID=${var.pgid}", "UID=${var.puid}", "VERSION=docker", "TZ=${var.timezone}"]
  ports {
    internal = 32400
    external = var.host_port
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
    container_path = "/media/youtube"
    host_path      = var.host_path_for_youtube_videos
  }
  volumes {
    container_path = "/media/family_videos"
    host_path      = var.host_path_for_family_videos
  }
  volumes {
    container_path = "/config"
    host_path      = var.host_path_for_config_files
  }
  restart = "unless-stopped"
}
