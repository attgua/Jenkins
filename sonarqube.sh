#!/bin/bash

# https://computingforgeeks.com/install-sonarqube-code-review-centos/

yum update -y
yum install -y vim wget curl
yum install -y java-11-openjdk-devel
setenforce 0
sed -i 's/^SELINUX=enforcing$/SELINUX=permissive/' /etc/selinux/config
echo "vm.max_map_count=262144"  >> /etc/sysctl.conf
sysctl -w vm.max_map_count=262144
echo "fs.file-max=65536"  >> /etc/sysctl.conf
sysctl -w fs.file-max=65536
useradd sonar
yum install -y https://download.postgresql.org/pub/repos/yum/reporpms/EL-7-x86_64/pgdg-redhat-repo-latest.noarch.rpm
yum -y install postgresql11-server postgresql11
/usr/pgsql-11/bin/postgresql-11-setup initdb
systemctl start postgresql-11
systemctl enable postgresql-11
