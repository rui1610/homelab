docker stop $(docker ps -a -q)
docker rm $(docker ps -a -q)
docker volume rm $(docker volume ls -q)
docker rmi $(docker images -a -q)
docker image prune -f
docker system prune -a -f

docker compose --env-file "../config/docker/variables.env" --env-file "../config/docker/my_credentials.env" -f "homer/prod/docker-compose.yml" build
docker compose --env-file "../config/docker/variables.env" --env-file "../config/docker/my_credentials.env" -f "homer/prod/docker-compose.yml" up -d

docker compose --env-file "../config/docker/variables.env" --env-file "../config/docker/my_credentials.env" -f "portainer/prod/docker-compose.yml" build
docker compose --env-file "../config/docker/variables.env" --env-file "../config/docker/my_credentials.env" -f "portainer/prod/docker-compose.yml" up -d

docker compose --env-file "../config/docker/variables.env" --env-file "../config/docker/my_credentials.env" -f "jellyfin/prod/docker-compose.yml" build
docker compose --env-file "../config/docker/variables.env" --env-file "../config/docker/my_credentials.env" -f "jellyfin/prod/docker-compose.yml" up -d


docker compose --env-file "../config/docker/variables.env" --env-file "../config/docker/my_credentials.env" -f "metube/prod/docker-compose.yml" build
docker compose --env-file "../config/docker/variables.env" --env-file "../config/docker/my_credentials.env" -f "metube/prod/docker-compose.yml" up -d

docker compose --env-file "../config/docker/variables.env" --env-file "../config/docker/my_credentials.env" -f "plex/prod/docker-compose.yml" build
docker compose --env-file "../config/docker/variables.env" --env-file "../config/docker/my_credentials.env" -f "plex/prod/docker-compose.yml" up -d
