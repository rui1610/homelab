resource "docker_image" "portainer" {
  name         = "portainer/portainer-ce:latest"
  keep_locally = false
}

resource "docker_container" "portainer" {
  image    = docker_image.portainer.image_id
  name     = "portainer"
  hostname = "portainer"
  env      = ["TZ=${var.timezone}"]
  ports {
    internal = 8000
    external = var.host_port_8000
  }
  ports {
    internal = 9000
    external = var.host_port_9000
  }
   volumes {
    container_path = "/data"
    host_path      = var.host_path_data
  }

  volumes {
    container_path = "/var/run/docker.sock"
    host_path      = var.docker_sock
  } 

  restart = "always"
}
