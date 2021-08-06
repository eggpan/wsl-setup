#!/bin/bash
set -e

currentDir="$PWD"

# add sudo user
sudo grep "$USER" /etc/sudoers >/dev/null 2>/dev/null && :
if [ $? -ne 0 ]; then
  echo "$USER ALL=NOPASSWD: ALL" | sudo EDITOR='tee -a' visudo
fi

# set apt repositories
sudo sed -i 's#//\(archive\.ubuntu\.com\)#//jp.\1#' /etc/apt/sources.list

# install git / language-pack-ja / ansible
sudo apt-get update \
&& sudo DEBIAN_FRONTEND=noninteractive apt-get install -y \
  -o Dpkg::Options::="--force-confdef" \
  -o Dpkg::Options::="--force-confold" \
  git python3-pip \
&& pip3 install ansible \
&& $HOME/.local/bin/ansible-galaxy collection install community.general

# clone and execute playbook
tmpDir=$(mktemp -d)
git clone https://github.com/eggpan/wsl-setup.git $tmpDir
cd $tmpDir/playbook
$HOME/.local/bin/ansible-playbook -i ,localhost --connection=local setup_wsl.yml
rm -rf $tmpDir

cd "$currentDir"
