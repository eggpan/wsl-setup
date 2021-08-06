#!/bin/bash -e

codename=$(lsb_release -cs)
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

# install ansible / whois
sudo apt-get update \
&& sudo DEBIAN_FRONTEND=noninteractive apt-get install -y \
  -o Dpkg::Options::="--force-confdef" \
  -o Dpkg::Options::="--force-confold" \
  python3-pip whois \
&& pip3 install ansible \
&& "${HOME}/.local/bin/ansible-galaxy" collection install community.general

# set apt repositories
country=$(whois $(curl -s checkip.amazonaws.com) | \
  grep country | \
  head -n 1 | \
  awk '{print $2}' | \
  tr '[A-Z]' '[a-z]'
)
sudo sed -i "s#//\(archive\.ubuntu\.com\)#//${country}.\1#" /etc/apt/sources.list

# clone and execute playbook
tmpDir=$(mktemp -d)
git clone git@github.com:eggpan/wsl-setup.git "${tmpDir}"
cd "${tmpDir}/playbook"
"${HOME}/.local/bin/ansible-playbook" -i ,localhost --connection=local setup_wsl.yml
rm -rf "${tmpDir}"

cd "${currentDir}"
