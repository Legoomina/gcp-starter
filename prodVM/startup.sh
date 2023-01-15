#! /bin/bash

# ================================== Init ================================================
sudo su
apt update
apt upgrade

# ================================== Network Config ======================================
ufw allow 2137 6969 3001

# ================================ Prepare libs ==========================================
snap install docker
curl -L "https://github.com/docker/compose/releases/download/1.29.2/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
apt install npm
apt install mvn
apt install openjdk11

# =============================== Prepare Directories ====================================

### INIT CONFIG ###
cd /
git clone https://github.com/Legoomina/project.git --recursive
git clone https://github.com/Legoomina/message-service.git
mkdir /custom_logging
mkdir /custom_logging/pids

### FRONTEND ###
wget -o /project/frontend/.env https://storage.cloud.google.com/bitehack/backend.env
cd /project/frontend
npm install

### BACKEND ###
wget -o /project/backend/.env https://storage.cloud.google.com/bitehack/frontend.env
cd /project/backend
npm install

### MAIN CONTAINER ###
wget -o /project/.env https://storage.cloud.google.com/bitehack/main.env
cd /project/
docker-compose up -d > /custom_logging/pids/docker-compose-pid


# =============================== Quality of life ========================================

tee -a "alias cdb='cd /backend'" | /home/*/.bashrc
tee -a "alias cdf='cd /frontend'" | /home/*/.bashrc
tee -a "alias ll='ls -alF'" | /home/*/.bashrc # Show all files in a directory, including hidden files.
tee -a "alias grep='grep --color=auto'" | /home/*/.bashrc # Highlight the matches when using grep.
tee -a "alias dc='docker-compose'" | /home/*/.bashrc # Shortcut for running docker-compose commands.
tee -a "alias ports='netstat -tulanp'" | /home/*/.bashrc # Show all open ports and the processes using them.
tee -a "alias reload='source ~/.bashrc'" | /home/*/.bashrc # Reload the bash configuration file.
tee -a "alias top='htop'" | /home/*/.bashrc # Use htop instead of top for system monitoring
tee -a "alias ..='cd ..'" | /home/*/.bashrc # Go up one directory level.
tee -a "alias ...='cd ../..'" | /home/*/.bashrc # Go up two directory levels.
tee -a "alias ....='cd ../../..'" | /home/*/.bashrc # Go up three directory levels.
tee -a "alias d='du -h'" | /home/*/.bashrc # Show disk usage in human-readable format.