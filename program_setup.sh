#!/bin/sh

sudo -n true

sudo apt update -y
echo Installing essentials
while read -r p ; do sudo apt-get install -y $p ; done < <(cat << "EOF"
    curl
    wget
    gcc
    snapd
    git
    firefox
    neovim
EOF
)

echo Installing snap packages
sudo snap install pycharm-professional --classic
sudo snap install clion --classic
sudo snap install intellij-idea-ultimate --classic
sudo snap install code --classic
sudo snap install spotify

echo Creating Brogramming
cd Documents
mkdir Brogramming

#install docker engine
echo Installing docker engine
sudo apt-get remove docker docker-engine docker.io containerd runc

sudo apt-get install \
    apt-transport-https \
    ca-certificates \
    curl \
    gnupg-agent \
    software-properties-common

curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -

sudo add-apt-repository \
   "deb [arch=amd64] https://download.docker.com/linux/ubuntu \
   $(lsb_release -cs) \
   stable"

sudo apt-get update

sudo apt-get install docker-ce docker-ce-cli containerd.io

#install docker compose
echo Installing docker compose
sudo curl -L "https://github.com/docker/compose/releases/download/1.25.4/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose

sudo chmod +x /usr/local/bin/docker-compose

#install virtual box
echo Installing virtualbox
sudo apt install virtualbox

#install zsh
echo Installing ZSH
sudo apt install zsh
sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"