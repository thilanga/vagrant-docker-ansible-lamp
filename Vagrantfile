# -*- mode: ruby -*-
# vi: set ft=ruby :

VAGRANTFILE_API_VERSION = "2"

name = "farm.thilanga.private"
ip = "192.168.11.22"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
  config.vm.define name do |machine|
    machine.vm.synced_folder "public/", "/var/www/html/site", :mount_options => ["dmode=777", "fmode=666"]
    machine.vm.provision :shell, :path => "ansible/provision.sh"
    machine.vm.box = "ubuntu/trusty64"
    machine.vm.hostname = "%s.metronome.private" % name
    machine.vm.network :private_network, ip: ip
    machine.vm.provider "virtualbox" do |v|
        v.name = name
        v.customize ["modifyvm", :id, "--memory", 3000]
    end
  end
end
