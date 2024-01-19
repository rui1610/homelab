docker compose --env-file "../../config/homelab.env" --env-file "../../config/my_credentials.env" build
docker compose --env-file "../../config/homelab.env" --env-file "../../config/my_credentials.env" up -d
