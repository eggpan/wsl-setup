## Script to set up the development environment for WSL2.

## Usage
`curl https://raw.githubusercontent.com/eggpan/wsl-setup/main/setup.sh | bash`

## Execution details
- Change the configuration so that the user executing the command can run sudo without a password
- Change the country of the apt repository
- Install pip
- Install Ansible
(The version of apt is a bit old, so we will use pip to install the latest version of Ansible)

Run the following in Ansible
- Add PHP / Docker / Google Chrome / MariaDB / Node.js / Yarn repositories to apt repository
- Install docker-ce
  - Add docker command execution permissions to the executing user
- Install Apache
- Install MySQL
- Install Postfix
- Install PHP7.4 / PHP8.0 / PHP8.1
- Install Node.js
- Install Yarn
