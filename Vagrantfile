# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure(2) do |config|
  config.vm.box = "ubuntu/trusty64"
  config.vm.network "forwarded_port", guest: 9020, host: 9020, auto_correct: true
  config.vm.provision "shell", path: "provisioner.sh"
end
