docker stop portainer
docker rm portainer
docker volume rm prod_vol_portainer
docker system prune -a -f
./start.sh