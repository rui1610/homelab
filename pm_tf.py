#!/usr/bin/env python3
import argparse
from python_terraform import Terraform

# parse the command line arguments
parser = argparse.ArgumentParser(description="Create a new VM in Proxmox")

# Add the arguments to the parser
parser.add_argument(
    "-pu",
    "--proxmox_url",
    metavar="proxmox_url",
    type=str,
    help="The URL of the Proxmox server",
)
parser.add_argument(
    "-pp",
    "--proxmox_password",
    metavar="proxmox_password",
    type=str,
    help="The password of the Proxmox user",
    required=True,
)
parser.add_argument(
    "-pus",
    "--proxmox_user",
    metavar="proxmox_user",
    type=str,
    help="The user of the Proxmox server",
)
parser.add_argument(
    "-vn", "--vm_name", metavar="vm_name", type=str, help="The name of the VM"
)
parser.add_argument(
    "-nn",
    "--node_name",
    metavar="node_name",
    type=str,
    help="The name of the node to create the VM on",
)
parser.add_argument(
    "-qos", "--qemu_os", metavar="qemu_os", type=int, help="The Qemu OS of the VM"
)
parser.add_argument(
    "-ot", "--os_type", metavar="os_type", type=str, help="The OS type of the VM"
)
parser.add_argument(
    "-iso", "--iso", metavar="iso", type=str, help="The ISO to use for the VM"
)
parser.add_argument(
    "-c",
    "--cores",
    metavar="cores",
    type=int,
    help="The number of cores to use for the VM",
)
parser.add_argument(
    "-s",
    "--sockets",
    metavar="sockets",
    type=int,
    help="The number of sockets to use for the VM",
)
parser.add_argument(
    "-m", "--memory", metavar="memory", type=int, help="The memory to use for the VM"
)
parser.add_argument(
    "-dc",
    "--disk_container",
    metavar="disk_container",
    type=int,
    help="The disk size to use for the VM",
)
parser.add_argument(
    "-dt",
    "--disk_type",
    metavar="disk_type",
    type=int,
    help="The disk type [ IDE, SATA...] size to use for the VM",
)
parser.add_argument(
    "-ds",
    "--disk_size",
    metavar="disk_size",
    type=int,
    help="The disk size to use for the VM",
)
parser.add_argument(
    "-nm",
    "--net_model",
    metavar="net_model",
    type=int,
    help="The network card model to use for the VM",
)
parser.add_argument(
    "-nb",
    "--net_bridge",
    metavar="net_bridge",
    type=int,
    help="The network bridge to use for the VM",
)

# Parse the arguments
args = parser.parse_args()


# Create a class with the variables of the new VM and setting the values
class ProxmoxVM(object):
    pass


proxmoxVM = ProxmoxVM()

# Iterate over the arguments passed to the script and set the values of the class
for i in vars(args):
    if getattr(args, i) is not None:
        setattr(proxmoxVM, i, getattr(args, i))
    else:
        setattr(proxmoxVM, i, None)

# Invoke Terraform
tf = Terraform(working_dir="./tf")

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
    auto_approve=True,
    var={
        "proxmox_url": proxmoxVM.proxmox_url,
        "proxmox_password": proxmoxVM.proxmox_password,
        "proxmox_user": proxmoxVM.proxmox_user,
        "vm_name": proxmoxVM.vm_name,
        "target_node": proxmoxVM.node_name,
        "qemu_os": proxmoxVM.qemu_os,
        "os_type": proxmoxVM.os_type,
        "iso": proxmoxVM.iso,
        "cores": proxmoxVM.cores,
        "sockets": proxmoxVM.sockets,
        "memory": proxmoxVM.memory,
        "disk_type": proxmoxVM.disk_type,
        "disk_storage": proxmoxVM.disk_container,
        "disk_size": proxmoxVM.disk_size,
        "network_model": proxmoxVM.net_model,
        "network_bridge": proxmoxVM.net_bridge,
    },
)

# If the apply fails, exit the script
if tfApply[0] != 0:
    print("Terraform apply failed")
    exit(1)
else:
    print(
        "Terraform apply successful. A new VM was created with the follwing name: {}.".format(
            proxmoxVM.vm_name
        )
    )
