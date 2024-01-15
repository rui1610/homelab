#!/bin/bash 

# Setup the Proxmox CLX container
cd proxmox/terraform
terraform init
terraform apply -auto-approve

# Back to the main folder
cd ../..
