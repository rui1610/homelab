from pathlib import Path

ROOT = Path(__file__, "..", "..", "..", "..").resolve()

FOLDER_ENVS = Path(ROOT, "config")
FOLDER_PROXMOX_TF = Path(ROOT, "tf", "proxmox")

FILE_ENVS_SECRETS = Path(FOLDER_ENVS, "secrets.env")
FILE_ENVS_HOMELAB = Path(FOLDER_ENVS, "homelab.env")
