#!/bin/sh
#Kør brug sudo bash ./program_setup.sh
sudo -n true
echo Updating
sudo apt update -y
sudo apt upgrade -y
echo Installing essentials

sudo apt-get install -y curl
sudo apt-get install -y wget
sudo apt-get install -y gcc
sudo apt-get install -y snapd
sudo apt-get install -y git
sudo apt-get install -y firefox
sudo apt-get install -y neovim

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

sudo apt-get install -y \
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

sudo apt-get install -y docker-ce docker-ce-cli containerd.io

#install docker compose
echo Installing docker compose
sudo curl -L "https://github.com/docker/compose/releases/download/1.25.4/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose

sudo chmod +x /usr/local/bin/docker-compose

#install virtual box
echo Installing virtualbox
sudo apt install -y virtualbox

#install zsh
echo Installing ZSH
sudo apt install -y zsh
sh -c -y "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

exit
