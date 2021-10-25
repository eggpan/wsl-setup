#!/bin/bash -e

codename=$(sed -n '/DISTRIB_CODENAME/p' /etc/lsb-release | cut -d'=' -f2)
if [ "${codename}" != "focal" ]; then
  echo "error: this script is only for ubuntu 20.04." 1>&2
  exit 1
fi

currentDir="${PWD}"

# add sudo user
sudo grep "${USER}" /etc/sudoers >/dev/null 2>/dev/null && :
if [ $? -ne 0 ]; then
  echo "${USER} ALL=NOPASSWD: ALL" | sudo EDITOR='tee -a' visudo
fi

# install ansible
sudo apt-get update \
&& sudo DEBIAN_FRONTEND=noninteractive apt-get install -y \
  -o Dpkg::Options::="--force-confdef" \
  -o Dpkg::Options::="--force-confold" \
  python3-pip \
&& pip install --user ansible \
&& source "${HOME}/.profile" \
&& ansible-galaxy collection install community.general community.mysql

# set apt repositories
country=$(curl -sL http://rdap.apnic.net/ip/$(curl -s checkip.amazonaws.com) | sed 's/.*"country":"\(..\).*/\L\1/')
if [ -n "$country" ]; then
  sudo sed -i "s#//\(archive\.ubuntu\.com\)#//${country}.\1#" /etc/apt/sources.list
fi

# clone and execute playbook
tmpDir=$(mktemp -d)
git clone git@github.com:eggpan/wsl-setup.git "${tmpDir}"
cd "${tmpDir}/playbook"
ansible-playbook -i ,localhost -c=local setup_wsl.yml
rm -rf "${tmpDir}"

cd "${currentDir}"
