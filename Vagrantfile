# -*- mode: ruby -*-
# vi: set ft=ruby :

VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|  
 
  if Vagrant.has_plugin?("vagrant-proxyconf")
    config.proxy.http     = "http://10.0.2.2:3128/"
    config.proxy.https    = "http://10.0.2.2:3128/"
    config.proxy.no_proxy = "localhost,127.0.0.1,10.0.2.2"
  end
 
  config.vm.box = "ubuntu/trusty64"
  config.vm.hostname = "vagrant-docker-rails"  
  config.vm.network "forwarded_port", guest: 3000, host: 3000     
  config.vm.network "forwarded_port", guest: 80, host: 8000
  config.vm.synced_folder ".", "/vagrant", disabled: false
  
  config.vm.provider "virtualbox" do |vb| 
    vb.name = "vagrant-docker-rails"       
    vb.memory = 2048       
    vb.cpus = 2       
  end  
  
  config.vm.provision "docker" 
  config.vm.provision :shell, path: "./bootstrap.sh", privileged: false, keep_color: true
      
end
