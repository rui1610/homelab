resource "docker_image" "homer" {
  name         = "b4bz/homer:latest"
  keep_locally = false
}

resource "docker_container" "homer" {
  image = docker_image.homer.image_id
  name  = var.container_name
  hostname = var.container_name
  env = ["TZ=${var.timezone}", "INIT_ASSETS=0"]
  # user = "${var.puid}:${var.pgid}"
  ports {
    internal = var.port_container
    external = var.port_host
  }
  volumes {
      container_path = "/www/assets"
      host_path      = var.host_path_for_data
  }  
  restart = "always"
}