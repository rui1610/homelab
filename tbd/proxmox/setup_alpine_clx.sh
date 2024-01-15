# all commands to prepare the alpine VM to run docker
# https://benheater.com/proxmox-run-docker-on-linux-containers-lxc/
# Run the folliwng two commands on the proxmox host
#apt clean && apt update
#apt install -y fuse-overlayfs

# Now on the debian CLX
apk update && apk upgrade
apk add --update fuse-overlayfs ca-certificates curl gnupg lsb-release sudo cifs-utils nfs-utils 

# Add docker
apk add --update docker openrc 

# Enable the Docker engine to start at boot
rc-update add docker boot
service docker start



# ----------------------------------------------------------------------------------------------------------------
# Now add own user
# ----------------------------------------------------------------------------------------------------------------
adduser rui --gecos "" --uid 1000 --gid 1000 --disabled-password
usermod -aG sudo rui
echo "rui  ALL=(ALL) NOPASSWD:ALL" | sudo tee /etc/sudoers.d/rui

# ----------------------------------------------------------------------------------------------------------------
# Give user rights to run docker
# see https://docs.docker.com/engine/install/linux-postinstall/
# ----------------------------------------------------------------------------------------------------------------
groupadd docker
usermod -aG docker rui
