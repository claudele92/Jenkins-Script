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

if ! command -v wget &> /dev/null
then
    echo "wget command could not be found"
else
    yum install wget -y
fi

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

firewall-cmd --permanent --zone=public --add-port=8080/tcp

firewall-cmd --reload

echo "Jenkins Installation and configuration completed"
echo "Launch your google chrome browser an type your IP address followed by the port number 8080"