resource "docker_image" "vaultwarden" {
  name         = "vaultwarden/server:latest"
  keep_locally = false
}

resource "docker_container" "vaultwarden" {
  image = docker_image.vaultwarden.image_id
  name  = "vaultwarden"
  hostname = "vaultwarden"
  env = ["TZ=${var.timezone}"]
  ports {
    internal = var.port_container
    external = var.port_host
  }
  volumes {
      container_path = "/data"
      host_path      = var.host_path_for_data
  }
  restart = "unless-stopped"
}