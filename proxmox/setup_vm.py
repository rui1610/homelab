from python_terraform import Terraform
import json
from dotenv import load_dotenv
import os
from libs.constants.files import FILE_ENVS_SECRETS, FILE_ENVS_HOMELAB, FOLDER_PROXMOX_TF

load_dotenv(dotenv_path=FILE_ENVS_SECRETS)
load_dotenv(dotenv_path=FILE_ENVS_HOMELAB)

data = None

# read json file
with open("/workspaces/homelab/proxmox/configs/debian.json") as f:
    data = json.load(f)
    data["proxmox_api_token_secret"] = os.getenv("PROXMOX_API_TOKEN_SECRET")

# Invoke Terraform
tf = Terraform(working_dir=FOLDER_PROXMOX_TF)

# Initialize Terraform
tfInit = tf.init()

# If the init fails, exit the script
if tfInit[0] != 0:
    print("Terraform init failed")
    exit(1)

# Apply Terraform
tfApply = tf.apply(
    # capture_output=None,
    skip_plan=True,
    auto_approve=False,
    var=data,
)

print(tfApply)
