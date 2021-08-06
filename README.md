## Script to set up a WSL environment

## Usage.
`curl https://raw.githubusercontent.com/eggpan/wsl-setup/master/setup.sh | bash`

## Execution details.
* Change APT repository country
* Install pip
* Install Ansible
The version of APT is a bit old, so I used pip to install the latest version of Ansible.

The following is executed by Ansible
* Add php / docker / nodejs / yarn repositories to APT repository
* Install PHP7.4 / PHP8.0
* Install Node.js
* Install Yarn
