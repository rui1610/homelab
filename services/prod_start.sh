docker compose --env-file "../config/docker/variables.env" --env-file "../config/docker/my_credentials.env" -f "homer/prod/docker-compose.yml" up -d
docker compose --env-file "../config/docker/variables.env" --env-file "../config/docker/my_credentials.env" -f "homer/prod/docker-compose.yml" build

docker compose --env-file "../../../config/docker/homelab.env" --env-file "../../../config/docker/my_credentials.env" -f "portainer/prod/docker-compose.yml" build
docker compose --env-file "../config/docker/variables.env" --env-file "../config/docker/my_credentials.env" -f "portainer/prod/docker-compose.yml" up -d

docker compose --env-file "../config/docker/variables.env" --env-file "../config/docker/my_credentials.env" -f "jellyfin/prod/docker-compose.yml" build
docker compose --env-file "../config/docker/variables.env" --env-file "../config/docker/my_credentials.env" -f "jellyfin/prod/docker-compose.yml" up -d


docker compose --env-file "../config/docker/variables.env" --env-file "../config/docker/my_credentials.env" -f "metube/prod/docker-compose.yml" build
docker compose --env-file "../config/docker/variables.env" --env-file "../config/docker/my_credentials.env" -f "metube/prod/docker-compose.yml" up -d

docker compose --env-file "../config/docker/variables.env" --env-file "../config/docker/my_credentials.env" -f "plex/prod/docker-compose.yml" build
docker compose --env-file "../config/docker/variables.env" --env-file "../config/docker/my_credentials.env" -f "plex/prod/docker-compose.yml" up -d

docker compose --env-file "../config/docker/variables.env" --env-file "../config/docker/my_credentials.env" -f "minecraft/docker-compose.yml" build
docker compose --env-file "../config/docker/variables.env" --env-file "../config/docker/my_credentials.env" -f "minecraft/docker-compose.yml" up -d
