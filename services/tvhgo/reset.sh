docker stop mediathek
docker rm -v mediathek
docker volume rm vol_media_tv
docker volume prune -f

