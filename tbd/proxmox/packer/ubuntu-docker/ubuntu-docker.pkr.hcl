# Ubuntu Server Focal Docker
# ---
# Packer Template to create an Ubuntu Server (Focal) with Docker on Proxmox

# Variable Definitions
variable "proxmox_api_url" {
    type = string
}

variable "proxmox_api_token_id" {
    type = string
}

variable "proxmox_api_token_secret" {
    type = string
    sensitive = true
}

variable "ssh_user_name" {
    type = string
}

variable "ssh_user_password" {
    type = string
    sensitive = true
}
variable "proxmox_node" {
    type = string
    sensitive = true
}
# Resource Definiation for the VM Template
source "proxmox" "ubuntu-docker" {
 
    # Proxmox Connection Settings
    proxmox_url = "${var.proxmox_api_url}"
    username = "${var.proxmox_api_token_id}"
    token = "${var.proxmox_api_token_secret}"
    # (Optional) Skip TLS Verification
    insecure_skip_tls_verify = true
    
    # VM General Settings
    node = "${var.proxmox_node}"
    vm_id = "100"
    vm_name = "ubuntu-docker"
    template_description = "ubuntu Server Image with Docker pre-installed"

    # VM OS Settings
    # (Option 1) Local ISO File
    iso_file = "local:iso/ubuntu-22.04.3-live-server-amd64.iso"
    # - or -
    # (Option 2) Download ISO (checkout https://ubuntu.com/download/server)
    #iso_url = "https://releases.ubuntu.com/22.04.3/ubuntu-22.04.3-live-server-amd64.iso"
    #iso_checksum = "a4acfda10b18da50e2ec50ccaf860d7f20b389df8765611142305c0e911d16fd"
    iso_storage_pool = "local"
    unmount_iso = true

    # VM System Settings
    qemu_agent = true

    # VM Hard Disk Settings
    scsi_controller = "virtio-scsi-pci"

    disks {
        disk_size = "20G"
        format = "qcow2"
        storage_pool = "local-lvm"
        storage_pool_type = "lvm"
        type = "virtio"
    }

    # VM CPU Settings
    cores = "1"
    
    # VM Memory Settings
    memory = "2048" 

    # VM Network Settings
    network_adapters {
        model = "virtio"
        bridge = "vmbr0"
        firewall = "false"
    } 

    # VM Cloud-Init Settings
    cloud_init = true
    cloud_init_storage_pool = "local-lvm"

    # PACKER Boot Commands
    boot_command = [
        "<esc><wait><esc><wait>",
        "<f6><wait><esc><wait>",
        "<bs><bs><bs><bs><bs>",
        "autoinstall ds=nocloud-net;s=http://{{ .HTTPIP }}:{{ .HTTPPort }}/ ",
        "--- <enter>"
    ]
    boot = "c"
    boot_wait = "5s"

    # PACKER Autoinstall Settings
    http_directory = "http" 
    # (Optional) Bind IP Address and Port
    # http_bind_address = "0.0.0.0"
    # http_port_min = 8802
    # http_port_max = 8802

    ssh_username = "${var.ssh_user_name}"

    # (Option 1) Add your Password here
    ssh_password = "${var.ssh_user_password}"
    # - or -
    # (Option 2) Add your Private SSH KEY file here
    # ssh_private_key_file = "~/.ssh/id_rsa"

    # Raise the timeout, when installation takes longer
    ssh_timeout = "20m"
}

# Build Definition to create the VM Template
build {

    name = "ubuntu-server-docker"
    sources = ["source.proxmox.ubuntu-server-docker"]

    # Provisioning the VM Template for Cloud-Init Integration in Proxmox #1
    provisioner "shell" {
        inline = [
            "while [ ! -f /var/lib/cloud/instance/boot-finished ]; do echo 'Waiting for cloud-init...'; sleep 1; done",
            "sudo rm /etc/ssh/ssh_host_*",
            "sudo truncate -s 0 /etc/machine-id",
            "sudo apt -y autoremove --purge",
            "sudo apt -y clean",
            "sudo apt -y autoclean",
            "sudo cloud-init clean",
            "sudo rm -f /etc/cloud/cloud.cfg.d/subiquity-disable-cloudinit-networking.cfg",
            "sudo sync"
        ]
    }

    # Provisioning the VM Template for Cloud-Init Integration in Proxmox #2
    provisioner "file" {
        source = "files/99-heimbox.cfg"
        destination = "/tmp/99-pve.cfg"
    }

    # Provisioning the VM Template for Cloud-Init Integration in Proxmox #3
    provisioner "shell" {
        inline = [ "sudo cp /tmp/99-pve.cfg /etc/cloud/cloud.cfg.d/99-pve.cfg" ]
    }

    # Provisioning the VM Template with Docker Installation #4
    provisioner "shell" {
        inline = [
            "sudo apt-get install -y ca-certificates curl gnupg lsb-release",
            "curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg",
            "echo \"deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable\" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null",
            "sudo apt-get -y update",
            "sudo apt-get install -y docker-ce docker-ce-cli containerd.io"
        ]
    }
}