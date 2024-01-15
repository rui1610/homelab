resource "docker_image" "zdfmediathek" {
  name         = "conrad784/mediathekview-webinterface"
  keep_locally = false
}

resource "docker_container" "zdfmediathek" {
  image = docker_image.zdfmediathek.image_id
  name  = "zdfmediathek"
  hostname = "zdfmediathek"
  env = ["TZ=${var.timezone}"]
  ports {
    internal = var.port_container
    external = var.port_host
  }
  volumes {
      container_path = "/root/MediathekView"
      host_path      = var.host_path_for_downloads
  }
  restart = "always"
}