docker stop mediathek
docker rm -v mediathek
docker volume rm vol_mediathek_prod
docker volume prune -f

