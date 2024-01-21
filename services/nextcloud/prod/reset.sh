docker stop nextcloud_db
docker rm -v nextcloud_db
docker stop nextcloud_prod
docker rm -v nextcloud_prod
docker volume rm vol_nextcloud_db_prod
docker volume rm vol_nextcloud_prod
docker volume prune -f

