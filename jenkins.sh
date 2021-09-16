#!/bin/bash

yum install -y wget
wget -O /etc/yum.repos.d/jenkins.repo \
    https://pkg.jenkins.io/redhat-stable/jenkins.repo
rpm --import https://pkg.jenkins.io/redhat-stable/jenkins.io.key
yum upgrade
yum install -y epel-release java-11-openjdk-devel
yum install -y jenkins
systemctl daemon-reload
systemctl enable jenkins
systemctl start jenkins
sleep 1m
JENKINSPWD=$(cat /var/lib/jenkins/secrets/initialAdminPassword)
yum install -y git
echo $JENKINSPWD