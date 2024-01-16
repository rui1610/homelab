docker stop portainer
docker rm portainer
docker volume rm vol_portainer
docker system prune -a -f
