#!/bin/bash
apt update
apt upgrade -y
apt install git -y
apt install tree bridge-utils -y

# Install docker
apt install apt-transport-https ca-certificates curl software-properties-common -y
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu focal stable"
apt-cache policy docker-ce
apt install docker-ce -y

# Install docker-compose
curl -L "https://github.com/docker/compose/releases/download/1.29.2/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
chmod +x /usr/local/bin/docker-compose

# Install Java
apt install openjdk-21-jre-headless -y

# Install Unzip
apt install unzip -y

# Install NodeJS
apt install nodejs npm -y
npm cache clean -f
npm install -g n
n stable

# Make Python3 default
update-alternatives --install /usr/bin/python python /usr/bin/python3 10

# Install Besu
wget -P /usr/share https://github.com/hyperledger/besu/releases/download/24.3.0/besu-24.3.0.zip
unzip /usr/share/besu-24.3.0.zip -d /usr/share
rm /usr/share/besu-24.3.0.zip
printf "if [ -f /etc/.bash_aliases ]; then\n\t. /etc/.bash_aliases\nfi\n" >> /etc/bash.bashrc
echo "alias besu=/usr/share/besu-24.3.0/bin/besu" >> /etc/.bash_aliases

# Install Truffle
npm install -g truffle