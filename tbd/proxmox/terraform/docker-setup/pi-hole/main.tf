resource "docker_image" "pihole" {
  name         = "pihole/pihole:latest"
  keep_locally = false
}

resource "docker_container" "pihole" {
  image = docker_image.pihole.image_id
  name  = "pihole"
  hostname = "pihole"
  env = ["TZ=${var.timezone}", "WEBPASSWORD=${var.pihole_web_password}"
  ]

  ports {
    internal = 53
    protocol = "udp"
    external = var.host_port_53
  }
  ports {
    internal = 53
    protocol = "tcp"
    external = var.host_port_53
  }
  ports {
    internal = 80
    protocol = "tcp"
    external = var.host_port_80
  }

  volumes {
    container_path = "/etc/pihole"
    host_path      = var.host_path_pihole
  }
  volumes {
    container_path = "/etc/dnsmasq.d"
    host_path      = var.host_path_dnsmasq
  }
  restart = "always"

}
