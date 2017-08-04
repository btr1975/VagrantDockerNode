# -*- mode: ruby -*-
# vi: set ft=ruby :

# Author: Benjamin P. Trachtenberg
# Version: 1.0.0

# All Vagrant configuration is done below. The "2" in Vagrant.configure
# configures the configuration version (we support older styles for
# backwards compatibility). Please don't change it unless you know what
# you're doing.
Vagrant.configure("2") do |config|

    (1..2).each do |i|
        config.vm.define "DockerSwarm#{i}" do |node|
            node.vm.box = "ubuntu/xenial64"
            node.vm.hostname = "DockerSwarm#{i}"
            node.vm.network "public_network", ip: "192.168.1.4#{i - 1}"
            node.vm.provision :shell, path: "dockernode.sh"
        end
    end

end
