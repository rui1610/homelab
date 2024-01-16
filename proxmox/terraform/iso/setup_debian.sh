# ----------------------------------------------------------------------------------------------------------------
# Prepare the debian VM to run docker on LXC
# (see https://benheater.com/proxmox-run-docker-on-linux-containers-lxc/)
# ----------------------------------------------------------------------------------------------------------------
apt clean && apt update
# Ensure pre-requisites are installed
apt install -y ca-certificates curl gnupg nfs-common sudo nano cifs-utils lsb-release openssh-server

# ----------------------------------------------------------------------------------------------------------------
# Install Docker Engine 
# ----------------------------------------------------------------------------------------------------------------
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
systemctl enable containerd
newgrp docker

# ----------------------------------------------------------------------------------------------------------------
# Enable ssh to root
# ----------------------------------------------------------------------------------------------------------------
sed -i 's/#PermitRootLogin prohibit-password/PermitRootLogin yes/g' /etc/ssh/sshd_config
/etc/init.d/ssh restart

# ----------------------------------------------------------------------------------------------------------------
# Install Terraform (see https://developer.hashicorp.com/terraform/tutorials/aws-get-started/install-cli)
# ----------------------------------------------------------------------------------------------------------------
apt update && sudo apt install -y gnupg software-properties-common
# Install the HashiCorp GPG key.
wget -O- https://apt.releases.hashicorp.com/gpg | \
gpg --dearmor | \
tee /usr/share/keyrings/hashicorp-archive-keyring.gpg
# Verify the key's fingerprint.
gpg --no-default-keyring \
--keyring /usr/share/keyrings/hashicorp-archive-keyring.gpg \
--fingerprint
# Add the official HashiCorp repository to your system
echo "deb [signed-by=/usr/share/keyrings/hashicorp-archive-keyring.gpg] \
https://apt.releases.hashicorp.com $(lsb_release -cs) main" | \
tee /etc/apt/sources.list.d/hashicorp.list
# Download the package information from HashiCorp
apt update
# Install Terraform from the new repository.
apt install -y terraform

# ----------------------------------------------------------------------------------------------------------------
# Give rui user rights to run docker and make him sudo
# see https://docs.docker.com/engine/install/linux-postinstall/
# ----------------------------------------------------------------------------------------------------------------
usermod -aG sudo rui
echo "rui  ALL=(ALL) NOPASSWD:ALL" | sudo tee /etc/sudoers.d/rui
groupadd docker
usermod -aG docker rui
newgrp docker
