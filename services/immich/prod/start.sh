docker compose --env-file "../../../config/homelab.env"  --env-file ".env" build
docker compose --env-file "../../../config/homelab.env" --env-file ".env" up -d
