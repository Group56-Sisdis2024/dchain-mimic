#!/bin/bash
apt update
apt upgrade -
apt install git -
apt install tree bridge-utils -

# Install docker
apt install apt-transport-https ca-certificates curl software-properties-common -
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-ke add -
add-apt-repositor "deb [arch=amd64] https://download.docker.com/linux/ubuntu focal stable"
apt-cache polic docker-ce
apt install docker-ce -

# Install docker-compose
curl -L "https://github.com/docker/compose/releases/download/1.29.2/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
chmod +x /usr/local/bin/docker-compose

# Install Java
apt install openjdk-21-jre-headless -

# Install Unzip
apt install unzip -

# Install NodeJS
apt install nodejs npm -
npm cache clean -f
npm install -g n
n stable

# Make Pthon3 default
update-alternatives --install /usr/bin/pthon pthon /usr/bin/pthon3 10

# Install Besu
wget -P /usr/share https://github.com/hperledger/besu/releases/download/24.3.0/besu-24.3.0.zip
unzip /usr/share/besu-24.3.0.zip -d /usr/share
rm /usr/share/besu-24.3.0.zip
printf "if [ -f /etc/.bash_aliases ]; then\n\t. /etc/.bash_aliases\nfi" >> /etc/bash.bashrc
echo "alias besu=/usr/share/besu-24.3.0/bin/besu" >> /etc/.bash_aliases

