# all commands to prepare the alpine VM to run docker
# https://benheater.com/proxmox-run-docker-on-linux-containers-lxc/
# Run the folliwng two commands on the proxmox host
#apt clean && apt update
#apt install -y fuse-overlayfs

# Now on the debian CLX
apt clean && apt update && apt upgrade -y
#apt install -y fuse-overlayfs
#ln -s /usr/bin/fuse-overlayfs /usr/local/bin/fuse-overlayfs
# Ensure pre-requisites are installed
apt install -y ca-certificates curl gnupg lsb-release sudo nfs-common cifs-utils
# Add Docker GPG key
mkdir -p /etc/apt/keyrings
curl -fsSL https://download.docker.com/linux/debian/gpg | gpg --dearmor -o /etc/apt/keyrings/docker.gpg
# Add Docker apt repository
echo "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/debian $(lsb_release -cs) stable" | tee /etc/apt/sources.list.d/docker.list > /dev/null
# Update sources and install Docker Engine
apt update
apt install -y docker-ce docker-ce-cli containerd.io docker-compose docker-compose-plugin
# Enable the Docker engine to start at boot
systemctl enable docker

# ----------------------------------------------------------------------------------------------------------------
# Now add own user
# ----------------------------------------------------------------------------------------------------------------
adduser rui --gecos "" --uid 1000 --gid 100 --disabled-password
usermod -aG sudo rui
echo "rui  ALL=(ALL) NOPASSWD:ALL" | sudo tee /etc/sudoers.d/rui

# ----------------------------------------------------------------------------------------------------------------
# Give user rights to run docker
# see https://docs.docker.com/engine/install/linux-postinstall/
# ----------------------------------------------------------------------------------------------------------------
groupadd docker
usermod -aG docker rui
