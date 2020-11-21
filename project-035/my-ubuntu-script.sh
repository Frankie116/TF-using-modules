#!/bin/bash
sudo apt update -y   

sudo apt install apache2 -y
sudo systemctl enable httpd
sudo systemctl start httpd
sudo systemctl start apache2

sudo apt-get install default-jre -y
sudo apt-get install default-jdk
java -version

wget -q -O - https://pkg.jenkins.io/debian-stable/jenkins.io.key | sudo apt-key add -
echo 'deb https://pkg.jenkins.io/debian-stable binary/' | sudo tee -a /etc/apt/sources.list
sudo apt-get update -y
sudo apt-get install jenkins -y 
sudo cat /var/lib/jenkins/secrets/initialAdminPassword
sudo systemctl start jenkins
sudo systemctl status jenkins

echo "<html><body><div>Welcome to the Jenkins Server (${my-scriptname}) </div></body></html>" > /var/www/html/index.html
