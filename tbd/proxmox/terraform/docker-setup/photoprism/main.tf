# Definition based on example at https://dl.photoprism.app/docker/docker-compose.yml

resource "docker_image" "mariadb" {
  name         = "mariadb:11"
  keep_locally = false
}

resource "docker_container" "mariadb" {
  image = docker_image.mariadb.image_id
  name  = "mariadb"
  hostname = "mariadb"
  restart = "unless-stopped"
  security_opts = [ "seccomp:unconfined","apparmor:unconfined" ]
  command = [ "--innodb-buffer-pool-size=512M --transaction-isolation=READ-COMMITTED --character-set-server=utf8mb4 --collation-server=utf8mb4_unicode_ci --max-connections=512 --innodb-rollback-on-timeout=OFF --innodb-lock-wait-timeout=120" ]

  volumes {
      container_path = "/var/lib/mysql"
      host_path      = var.host_path_for_mariadb
  }
  env = ["MARIADB_AUTO_UPGRADE=1", "MARIADB_INITDB_SKIP_TZINFO=1", "MARIADB_DATABASE=photoprism", "MARIADB_USER=photoprism", "MARIADB_PASSWORD=${var.db_password}", "MARIADB_ROOT_PASSWORD=${var.root_password}"]
}


resource "docker_image" "photoprism" {
  name         = "photoprism/photoprism:latest"
  keep_locally = false
}

resource "docker_container" "photoprism" {
  image = docker_image.photoprism.image_id
  depends_on = [ docker_image.mariadb ]
  ## If the service gets stuck in a restart loop, this points to a memory, filesystem, network, or database issue:
  ## https://docs.photoprism.app/getting-started/troubleshooting/#fatal-server-errors
  restart = "unless-stopped"

  name  = "photoprism"
  hostname = "photoprism"

  security_opts = [ "seccomp:unconfined","apparmor:unconfined" ]
  ports {
    internal = var.port_container
    external = var.port_host
  }

  env = [
    "TZ=${var.timezone}",
    "PHOTOPRISM_ADMIN_USER=admin",
    "PHOTOPRISM_ADMIN_PASSWORD=${var.root_password}",
    "PHOTOPRISM_DATABASE_PASSWORD=${var.db_password}",
    "PHOTOPRISM_AUTH_MODE=password",
    "PHOTOPRISM_SITE_URL=http://localhost:${var.port_container}/",
    "PHOTOPRISM_DISABLE_TLS=false",
    "PHOTOPRISM_DEFAULT_TLS=true",
    "PHOTOPRISM_ORIGINALS_LIMIT=5000",
    "PHOTOPRISM_HTTP_COMPRESSION=gzip",
    "PHOTOPRISM_LOG_LEVEL=info",
    "PHOTOPRISM_READONLY=false",
    "PHOTOPRISM_EXPERIMENTAL=false",
    "PHOTOPRISM_DISABLE_CHOWN=false",
    "PHOTOPRISM_DISABLE_WEBDAV=false",
    "PHOTOPRISM_DISABLE_SETTINGS=false",
    "PHOTOPRISM_DISABLE_TENSORFLOW=false",
    "PHOTOPRISM_DISABLE_FACES=false",
    "PHOTOPRISM_DISABLE_CLASSIFICATION=false",
    "PHOTOPRISM_DISABLE_VECTORS=false",
    "PHOTOPRISM_DISABLE_RAW=false",
    "PHOTOPRISM_RAW_PRESETS=false",
    "PHOTOPRISM_JPEG_QUALITY=85",
    "PHOTOPRISM_DETECT_NSFW=false",
    "PHOTOPRISM_UPLOAD_NSFW=true",
    "PHOTOPRISM_DATABASE_DRIVER=mysql",
    "PHOTOPRISM_DATABASE_SERVER=mariadb:3306",
    "PHOTOPRISM_DATABASE_NAME=photoprism",
    "PHOTOPRISM_DATABASE_USER=photoprism",
    "PHOTOPRISM_SITE_CAPTION=AI-Powered Photos App",
    "PHOTOPRISM_SITE_DESCRIPTION=",
    "PHOTOPRISM_SITE_AUTHOR=Rui Nogueira"
    ]
  working_dir = "/photoprism" 

  command = [ "--config=/config/config.yml" ]

   volumes {
      container_path = "/photoprism/folder" 
      host_path      = var.host_path_for_pictures
  } 
   volumes {
      container_path = "/photoprism/storage" 
      host_path      = var.host_path_for_storage
  } 
}