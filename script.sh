#!/bin/bash

    #Authors: Lynn, Arthur, Nora, Rebecca, Nadine
    #Date: 13-June-2022

## Writing a script to automate Jenkins Configuration

## Installing jenkins on centos 7 server
# Step1: Install Java since Jenkins is a Java application
echo "Java installation start"
yum install java-1.8.0-openjdk-devel -y
echo "Java installation completed"

## Step2: Enable the Jenkins repository
# Check if the wget command is installed; if not installed it

yum install wget -y

wget -O /etc/yum.repos.d/jenkins.repo http://pkg.jenkins-ci.org/redhat/jenkins.repo

# Desabling the key check on the repo using the sed command 

sudo sed -i 's/gpgcheck=1/gpgcheck=0/g' /etc/yum.repos.d/jenkins.repo

## Step3: nstall the latest stable version of Jenkins

yum install jenkins -y

# Start Jenkins

systemctl start jenkins

# Check Jenkins status to find out if the daemon is running
systemctl status jenkins

# Enable the Jenkins service to start on system boot

systemctl enable jenkins

##Step4: Adjust the firewall

yum install firewalld -y
systemctl start firewalld

firewall-cmd --permanent --zone=public --add-port=8080/tcp

firewall-cmd --reload

echo "Jenkins Installation and configuration completed"

echo "copy the the IP address displayed, Launch your google chrome browser an type the IP address(inet) followed by the port number 8080 below and paste it on your browser"

ifconfig | grep 192

echo "To set up Jenkins in the browser:"
echo "copy the password displayed below and paste it on the jenkins first loginas administrator"

cat /var/lib/jenkins/secrets/initialAdminPassword

echo "Once login as admin, click on Install suggested plugins and create your first admin user with Username: utrains /  Password: school1"

#End: Enjoy Jenkins