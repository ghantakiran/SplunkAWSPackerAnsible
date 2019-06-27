#!/bin/bash
sleep 30
sudo sed -i -e 's/%sudo -H \s\+ALL=(ALL\(:ALL\)\?)\s\+ALL/%sudo ALL=NOPASSWD:ALL/g' /etc/sudoers
sudo sh -c 'echo  "\nansible ALL=(splunk)NOPASSWD:ALL" >> /etc/sudoers'
sudo groupadd -r splunk
sudo useradd -r -m -g splunk splunk
sudo usermod -aG splunk splunk
sudo groupadd -r ansible
sudo useradd -r -m -g ansible ansible
sudo usermod -aG ansible ansible
sudo sudo yum update -y
sudo -H  yum install -y python-dev python-pip python-setuptools python-requests python-yaml
sudo -H pip install --upgrade pip
sudo -H  pip  install ansible
sudo mkdir -p /opt/ansible/
sudo chown -R ansible:ansible /opt/ansible/
sudo chmod -R 555 /opt/ansible/
sudo mkdir -p /etc/ansible/
sudo chown -R ansible:ansible /etc/ansible/
sudo chmod -R 555 /etc/ansible/
