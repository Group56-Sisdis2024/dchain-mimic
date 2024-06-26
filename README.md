
# DChain Mimic

DChain Mimic is a private Ethereum blockchain that is designed for use by institutions and students of higher education for secure, private, and decentralised student information center, allowing students to view their grades and graduation status. It is implemented with Proof of Authority (PoA) consensus with IBFT 2.0 protocol, allowing for a private permissioned network.

This is a group project for 2024 Distributed Systems course (CSGE604154), Faculty of Computer Science, Universitas Indonesia.

## Contributors

This project is a collaboration between groups 5 and 6 led by Bayu Sektiaji (2206137492).

1. Faris Haidar Zuhdi (2006597336) 
2. Zidan Kharisma Adidarma (2006463881)
3. Muhammad Kenshin Himura Mahmuddin (2006473844)
4. Dafi Nafidz Radhiyya (2106701564)
5. Son Sulung Suryahatta Asnan (2106751455)
6. Muhammad Nurkholish (1806186881)

## Installation

To start running your node, open your Google Cloud Platform (GCP) Console and access your Cloud Shell. Then, provision a VM to serve as a validator node in the network with the following commands in your Cloud Shell.

### Provision Compute Engine VM
```
git clone https://github.com/Group56-Sisdis2024/dchain-mimic.git
cd dchain-mimic/terraform
terraform init
terraform plan
terraform apply
```

Wait for 15-30 minutes for the VM to initialise itself and for the startup scripts to start installing the necessary resources. Then, create or register an SSH Key for your VM from Compute Engine -> Metadata -> SSH keys. You can then begin to SSH into your VM and setup your node. Verify that the installation script has finished running by checking `/var/log/syslog`. 

```sh
cat /var/log/syslog | grep startup-script | tail
```

If it has finished it will say `google-startup-scripts.service: Succeeded.`, and then you can proceed with the next step.


### Run a Node

In your VM, run a node with the correct configurations with the following commands.

```sh
git clone https://github.com/Group56-Sisdis2024/dchain-mimic.git
cd dchain-mimic
chmod +x generate-keypair.sh
./generate-keypair.sh # generate new keypair for node
cd node
chmod +x *.sh
./start.sh
```

Alternatively, you can also start it as a background process with `./start-proc.sh`. It will then output the logs to `out.log`. If you run it as a background process and need to stop it, find the PID using `./find-proc.sh`, then `kill <pid>`.

Only use `generate-keypair.sh` once during setup unless you want to renew your keypair (you'll lose the old one if you don't back it up).


### Connect to Other Nodes

To join the network, you have to connect to other nodes. Notify other nodes of your enode URL so that they can add your node to their allowlist. You can open a new shell to run these commands aside from your main shell if your current shell is being used to run Besu.

**1. Allowlist other nodes** 

To add other nodes to your allowlist, use the following script that is located in `./node`.

```sh
./node-add-allowlist.sh <enode 1> <enode2> ... <enode-n>
```

**2. Peer with other nodes** 

Once you've ensured that both you and another node has had each other allowlisted, you can peer with the other node with the following script.

```sh
./node-add-peer.sh <enode url>
```
