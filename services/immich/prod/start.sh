docker compose --env-file "../../../config/homelab.env" --env-file "../../../config/my_credentials.env" --env-file ".env" build
docker compose --env-file "../../../config/homelab.env" --env-file "../../../config/my_credentials.env" --env-file ".env" up -d
