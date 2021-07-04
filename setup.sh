#!/bin/bash
set -e

currentDir="$PWD"

# set umask 022
sed -i 's/^#\(umask\)/\1/' ~/.profile

# set apt repositories
sudo sed -i 's#//\(archive\.ubuntu\.com\)#//jp.\1#' /etc/apt/sources.list

# install git / language-pack-ja / ansible
sudo apt-get update && \
sudo DEBIAN_FRONTEND=noninteractive apt-get install -y \
  -o Dpkg::Options::="--force-confdef" \
  -o Dpkg::Options::="--force-confold" \
  aptitude git language-pack-ja python3-pip
pip3 install ansible

# clone and execute playbook
tmpDir=$(mktemp -d)
git clone https://github.com/eggpan/wsl-setup.git $tmpDir
cd $tmpDir/playbook
$HOME/.local/bin/ansible-playbook -i ,localhost --connection=local -K setup_wsl.yml
rm -rf $tmpDir

cd "$currentDir"
