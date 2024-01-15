output "pihole" {
    value = docker_container.bind9
    description = "The bind9 container metadata"
}