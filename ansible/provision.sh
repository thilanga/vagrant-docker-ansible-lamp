#!/bin/bash

sudo apt-get update
#sudo apt-get upgrade -y
sudo apt-get install linux-image-extra-`uname -r`
sudo apt-get -y install docker.io
sudo apt-get install -y python-pip python-dev python-pycurl
sudo pip install ansible

ln -sf /usr/bin/docker.io /usr/local/bin/docker
sed -i '$acomplete -F _docker docker' /etc/bash_completion.d/docker.io


sudo mkdir -p /etc/ansible
printf '[vagrant]\nlocalhost\n' | sudo tee /etc/ansible/hosts > /dev/null

echo Running provisioner: ansible
PYTHONUNBUFFERED=1 ansible-playbook -c local /vagrant/ansible/playbook.yml