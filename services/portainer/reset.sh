docker stop portainer
docker rm -v portainer
docker volume rm vol_portainer
docker volume prune -y
docker system prune -a -f
