output "photoprism" {
    value = docker_container.photoprism
    description = "The photoprism container metadata"
}

output "mariadb" {
    value = docker_container.mariadb
    description = "The mariadb container metadata"
}