docker stop jellyfin_prod
docker rm -v jellyfin_prod
docker volume rm vol_jellyfin_prod_config
docker volume rm vol_jellyfin_prod_cache
docker volume prune -f

