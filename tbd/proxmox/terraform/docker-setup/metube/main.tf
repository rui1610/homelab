resource "docker_image" "metube" {
  name         = "alexta69/metube:latest"
  keep_locally = false
}

resource "docker_container" "metube" {
  image = docker_image.metube.image_id
  name  = "metube"
  hostname = "metube"
  env = ["GID=${var.pgid}", "UID=${var.puid}", "TZ=${var.timezone}"]
  ports {
    internal = 8081
    external = var.port_host
  }
  volumes {
      container_path = "/downloads"
      host_path      = var.host_path_for_downloads
  }
  restart = "always"
}