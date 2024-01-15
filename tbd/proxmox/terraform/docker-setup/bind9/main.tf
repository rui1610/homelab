resource "docker_image" "bind9" {
  name         = "ubuntu/bind9:latest"
  keep_locally = false
}

resource "docker_container" "bind9" {
  image = docker_image.bind9.image_id
  name  = "bind9"
  hostname = "bind9"
  env = ["TZ=${var.timezone}", "BIND9_USER=${var.user}"]

  ports {
    internal = 53
    external = var.host_port_53
  }

  volumes {
    container_path = "/etc/bind/named.conf"
    host_path      = var.host_path_named_conf
  }

  volumes {
    container_path = "/var/cache/bind"
    host_path      = var.host_path_cached_data
  }

  volumes {
    container_path = "/var/lib/bind"
    host_path      = var.host_path_resource_records
  }

  restart = "always"
}
