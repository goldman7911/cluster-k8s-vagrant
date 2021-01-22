# -*- mode: ruby -*-
# vi: set ft=ruby :

ENV['VAGRANT_EXPERIMENTAL'] = "disks"

Vagrant.configure("2") do |config|
  config.vm.define "control-plane" do |cp|
    cp.vm.box = "ubuntu/focal64"
    cp.vm.hostname = "k8s-ControlPlane"
    cp.vm.disk :disk, size: "15GB", primary: true
    cp.vm.network "private_network", ip: "192.168.33.10"
    cp.vm.provider "virtualbox" do |vb|
      vb.name = "k8s-ControlPlane"
      vb.customize ["modifyvm", :id, "--memory", "2048"]
      vb.customize ["modifyvm", :id, "--cpus", "2"]
    end
    cp.vm.provision :shell, path: "script_base.sh"
    cp.vm.provision :shell, path: "control_plane.sh"
  end

  #Modificar conforme requesitos do host
  (1..2).each do |i|
    config.vm.define "worker-#{i}" do |node|
      node.vm.box = "ubuntu/focal64"
      node.vm.hostname = "k8s-Worker-#{i}"
      node.vm.disk :disk, size: "30GB", primary: true
      node.vm.network "private_network", ip: "192.168.33.2#{i}"
      node.vm.provider "virtualbox" do |vb|
        vb.name = "k8s-Worker-#{i}"
        vb.customize ["modifyvm", :id, "--memory", "4096"]
        vb.customize ["modifyvm", :id, "--cpus", "2"]
      end
      node.vm.provision :shell, path: "script_base.sh"
      node.vm.provision :shell, path: "worker.sh"
    end
  end
end