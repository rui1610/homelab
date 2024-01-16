docker compose --env-file "../../../config/docker/homelab.env" --env-file "../../../config/docker/my_credentials.env" build
docker compose --env-file "../../../config/docker/homelab.env" --env-file "../../../config/docker/my_credentials.env" up -d
