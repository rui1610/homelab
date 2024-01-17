docker stop plex_prod
docker rm -v plex_prod
docker volume rm vol_plex_prod
docker volume prune -f

