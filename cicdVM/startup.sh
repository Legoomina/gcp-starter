#! /bin/bash

# ================================== Init ================================================
sudo su
apt update
apt upgrade
apt install java-1.8.0-openjdk git
apt install wget

ufw allow 8080 22


wget -o /opt/apache.tar.gz https://archive.apache.org/dist/tomcat/tomcat-9/v9.0.50/bin/apache-tomcat-9.0.50.tar.gz
tar –xvzf /opt/apache.tar.gz
/opt/apache-tomcat-9.0.50/bin/catalina.sh start

wget -o /opt/apache-tomcat-9.0.50/webapps/jenkins.war https://get.jenkins.io/war-stable/2.289.2/jenkins.war

tee -a "export JENKINS_HOME=/opt/JenkinsHome" | /home/*/.bashrc

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