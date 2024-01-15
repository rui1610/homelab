resource "docker_image" "tvheadend" {
  name         = "linuxserver/tvheadend:release-4.2"
  keep_locally = false
}

resource "docker_container" "tvheadend" {
  image    = docker_image.tvheadend.image_id
  name     = "tvheadend"
  hostname = "tvheadend"
  env      = ["TZ=${var.timezone}"]
  ports {
    internal = 9981
    external = var.host_port_ui
  }

  volumes {
    container_path = "/media/tvrecorder"
    host_path      = var.host_path_for_tvrecordings
  }

  volumes {
    container_path = "/config"
    host_path      = var.host_path_for_config_files
  }

  restart = "always"
}
