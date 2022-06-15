#!/bin/bash

    #Authors: Lynn, Arthur, Nora, Rebecca, Nadine
    #Date: 13-June-2022

## Writing a script to automate Jenkins Configuration

#installation of wget
echo "installing wget"
yum install wget -y

#enable jenkins
wget -O /etc/yum.repos.d/jenkins.repo http://pkg.jenkins-ci.org/redhat/jenkins.repo

#now, disable key check on the repo
sed -i 's/gpgcheck=1/gpgcheck=0/g' /etc/yum.repos.d/jenkins.repo

#installation of jenkins
echo "installing jenkins"
yum install jenkins -y

#starting jenkins service
systemctl start jenkins
sleep 2

#checking the jenkins status
systemctl status jenkins
sleep 2

#enabeling jenkins
systemctl enable jenkins
sleep 5

firewall-cmd --permanent --zone=public --add-port=8080/tcp  
firewall-cmd --reload
echo "the ip and port will be displayed. with syntax <ip:port>"
sleep 3
ifconfig | grep 192
cat /var/lib/jenkins/secrets/initialAdminPassword
