# ----------------------------------------------------------------------------------------------------------------------------------------
# Run the module for metube
# ----------------------------------------------------------------------------------------------------------------------------------------
module "setup_metube" {
  source                  = "./metube"
  docker_host             = var.docker_host
  port_host               = 8998
  host_path_for_downloads = join("", [var.host_path_root, var.host_path_videos_recorder, "/youtube"])
  timezone                = var.timezone
  pgid                    = var.pgid
  puid                    = var.puid

}

# ----------------------------------------------------------------------------------------------------------------------------------------
# Run the module for pi-hole
# ----------------------------------------------------------------------------------------------------------------------------------------
module "setup_pihole" {
  source              = "./pi-hole"
  docker_host         = var.docker_host
  host_port_53        = "1053"
  host_port_80        = "1080"
  pihole_web_password = var.default_password

  host_path_pihole  = join("", [var.host_path_root, var.host_path_container_data, "/pi-hole/etc-pihole"])
  host_path_dnsmasq = join("", [var.host_path_root, var.host_path_container_data, "/pi-hole/etc-dnsmasq.d"])

  timezone = var.timezone
}


# ----------------------------------------------------------------------------------------------------------------------------------------
# Run the module for plex
# ----------------------------------------------------------------------------------------------------------------------------------------
module "setup_plex" {
  source      = "./plex"
  docker_host = var.docker_host
  host_port   = 32400

  host_path_for_movies         = join("", [var.host_path_root, var.host_path_movies, "/movies"])
  host_path_for_tvshows        = join("", [var.host_path_root, var.host_path_movies, "/tvshows"])
  host_path_for_family_videos  = join("", [var.host_path_root, var.host_path_movies, "/familie"])
  host_path_for_tvrecordings   = join("", [var.host_path_root, var.host_path_videos_recorder, "/tv"])
  host_path_for_youtube_videos = join("", [var.host_path_root, var.host_path_videos_recorder, "/youtube"])
  #host_path_for_config_files   = join("", [var.host_path_root, var.host_path_container_data, "/plex"])
  puid     = var.puid
  pgid     = var.pgid
  timezone = var.timezone
}


# ----------------------------------------------------------------------------------------------------------------------------------------
# Run the module for jellyfin
# ----------------------------------------------------------------------------------------------------------------------------------------
module "setup_jellyfin" {
  source                       = "./jellyfin"
  docker_host                  = var.docker_host
  port_container               = 8096
  port_host                    = 8096
  host_path_for_movies         = join("", [var.host_path_root, var.host_path_movies, "/movies"])
  host_path_for_tvshows        = join("", [var.host_path_root, var.host_path_movies, "/tvshows"])
  host_path_for_family_videos  = join("", [var.host_path_root, var.host_path_movies, "/familie"])
  host_path_for_tvrecordings   = join("", [var.host_path_root, var.host_path_videos_recorder, "/tv"])
  host_path_for_youtube_videos = join("", [var.host_path_root, var.host_path_videos_recorder, "/youtube"])
  # host_path_for_config_files   = join("", [var.host_path_root, var.host_path_container_data, "/jellyfin"])
  puid     = var.puid
  pgid     = var.pgid
  timezone = var.timezone
}

/*
# ----------------------------------------------------------------------------------------------------------------------------------------
# Run the module for tvheadend
# ---------------------------------------------------------------------------------------------------------------------------------------- 
module "setup_tvheadend" {
  source                     = "./tvheadend"
  docker_host                = var.docker_host
  host_port_ui               = 9981
  host_path_for_tvrecordings = join("", [var.host_path_root, var.host_path_movies, "/tv"])
  host_path_for_config_files = join("", [var.host_path_root, var.host_path_container_data, "/tvheadend"])
  puid                       = var.puid
  pgid                       = var.pgid
  timezone                   = var.timezone
}
*/
# ----------------------------------------------------------------------------------------------------------------------------------------
# Run the module for zdfmediathek
# ----------------------------------------------------------------------------------------------------------------------------------------
module "setup_zdfmediathek" {
  source                  = "./zdfmediathek"
  docker_host             = var.docker_host
  host_path_for_downloads = join("", [var.host_path_root, var.host_path_videos_recorder, "/tv"])
  puid                    = var.puid
  pgid                    = var.pgid
  port_host               = 5800
  timezone                = var.timezone
}

# ----------------------------------------------------------------------------------------------------------------------------------------
# Run the module for homer
# ----------------------------------------------------------------------------------------------------------------------------------------
module "setup_homer" {
  source             = "./homer"
  docker_host        = var.docker_host
  port_container     = 8080
  port_host          = 8080
  container_name     = "homer"
  host_path_for_data = join("", [var.host_path_root, var.host_path_container_data, "/homer_rui"])
  timezone           = var.timezone
}
 
# ----------------------------------------------------------------------------------------------------------------------------------------
# Run the module for portainer
# ----------------------------------------------------------------------------------------------------------------------------------------
module "setup_portainer" {
  source             = "./portainer"
  docker_host        = var.docker_host
  
  host_path_data = join("", [var.host_path_root, var.host_path_container_data, "/portainer"])
  timezone           = var.timezone
}

/* # ----------------------------------------------------------------------------------------------------------------------------------------
# Run the module for vaultwarden
# ----------------------------------------------------------------------------------------------------------------------------------------
module "setup_vaultwarden" {
  source             = "./vaultwarden"
  docker_host        = var.docker_host
  port_container     = 80
  port_host          = 8084
  host_path_for_data = join("", [var.host_path_root, var.host_path_container_data, "/vaultwarden"])
  timezone           = var.timezone
} */

# # ----------------------------------------------------------------------------------------------------------------------------------------
# # Run the module for bind9
# # ----------------------------------------------------------------------------------------------------------------------------------------
# module "setup_bind9" {
#   source                     = "./bind9"
#   docker_host                = var.docker_host
#   host_port_53               = "30053"
#   host_path_cached_data      = join("", [var.host_path_root, var.host_path_container_data, "/bind9/cached_data"])
#   host_path_resource_records = join("", [var.host_path_root, var.host_path_container_data, "/bind9/resource_records"])
#   host_path_named_conf       = join("", [var.host_path_root, var.host_path_container_data, "/bind9/conf/named.conf"])
#   user                       = "bind"

#   timezone = var.timezone
# }


# # ----------------------------------------------------------------------------------------------------------------------------------------
# # Run the module for photoprism
# # ----------------------------------------------------------------------------------------------------------------------------------------
# module "setup_photoprism" {
#   source                 = "./photoprism"
#   docker_host            = var.docker_host
#   port_container         = 2342
#   port_host              = 2342
#   host_path_for_pictures = join("", [var.host_path_root, var.host_path_pictures, "/sortiert"])
#   host_path_for_storage  = join("", [var.host_path_root, var.host_path_container_data, "/photoprism"])
#   host_path_for_mariadb  = join("", [var.host_path_root, var.host_path_container_data, "/mariadb"])
#   db_password            = var.default_password
#   root_password          = var.default_password
#   puid                   = var.puid
#   pgid                   = var.pgid
#   timezone               = var.timezone
# }
