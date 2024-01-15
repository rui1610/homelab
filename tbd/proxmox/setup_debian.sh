apt-get update && apt-get upgrade -y
apt-get install ca-certificates curl gnupg nfs-common cifs-utils -y
install -m 0755 -d /etc/apt/keyrings
curl -fsSL https://download.docker.com/linux/debian/gpg | sudo gpg --dearmor -o /etc/apt/keyrings/docker.gpg
chmod a+r /etc/apt/keyrings/docker.gpg

# Add the repository to Apt sources:
echo \
  "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/debian \
  $(. /etc/os-release && echo "$VERSION_CODENAME") stable" | \
  sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
apt-get update

apt-get install docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin -y
groupadd docker
newgrp docker
systemctl enable docker.service
systemctl enable containerd.service

# ----------------------------------------------------------------------------------------------------------------
# Give rui user rights to run docker and make him sudo
# ----------------------------------------------------------------------------------------------------------------
usermod -aG sudo rui
echo "rui  ALL=(ALL) NOPASSWD:ALL" | sudo tee /etc/sudoers.d/rui
usermod -aG docker rui
