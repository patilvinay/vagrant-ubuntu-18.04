# -*- mode: ruby -*-
# vi: set ft=ruby :

# All Vagrant configuration is done below. The "2" in Vagrant.configure
# configures the configuration version (we support older styles for
# backwards compatibility). Please don't change it unless you know what
# you're doing.
Vagrant.configure("2") do |config|
  # The most common configuration options are documented and commented below.
  # For a complete reference, please see the online documentation at
  # https://docs.vagrantup.com.

  hostname = "ubuntu.box"
  locale = "en_GB.UTF.8"
  # Every Vagrant development environment requires a box. You can search for
  # boxes at https://vagrantcloud.com/search.
  config.vm.box = "hashicorp/bionic64"
  config.vm.box_check_update = false
  config.vm.synced_folder "d:\\vbhome.", "/homeonhost", type: "nfs"
  config.vm.provision "file", source: "~/.ssh/", destination: "~/.ssh-host"
    
  config.vm.provider "virtualbox" do |v|
    v.name = "vagrant_ubuntu18_vb"
    v.memory = 2048
    v.cpus = 2
  end


  config.push.define "local-exec" do |push|
    push.inline = <<-SCRIPT
      echo "hello"
    SCRIPT
  end

  config.trigger.after :up do |trigger|
    trigger.name = "Finished Message"
    trigger.info = "Machine is up!"
  end

  config.trigger.before :up do |trigger|
    trigger.info = "Machine starting!"
    trigger.ignore = [:destroy, :halt]
  end

  config.vm.boot_timeout =300
  #config.ssh.username = "vinay"
  #config.ssh.username = "vinay"
  #config.ssh.password = "welcome"

  
  config.vm.provision :shell, :inline => "hostnamectl set-hostname #{hostname} && locale-gen #{locale}"
  config.vm.provision :shell, :inline => "apt-get update --fix-missing"
  config.vm.provision :shell, :inline => "apt-get update "
  config.vm.provision :shell, :inline => "apt-get install -y python3-pip git software-properties-common"
  config.vm.provision :shell, :inline => "sudo apt-add-repository --yes --update ppa:ansible/ansible"
  config.vm.provision :shell, :inline => "apt-get install -q -y ansible g++ make git curl vim"


  
  config.vm.network "public_network"

  
 


 
    # Run Ansible from the Vagrant VM
    config.vm.provision "ansible_local" do |ansible|
      ansible.inventory_path = "./playbooks/hosts.ini"
      ansible.playbook = "./playbooks/playbook.yaml"
     # ansible.install_mode = "pip"
    end



    config.vm.provision "ansible_local" do |ansible_node|
      ansible_node.inventory_path = "./playbooks/hosts.ini"
      ansible_node.playbook = "./playbooks/nodejs-playbook.yaml"
     # ansible.install_mode = "pip"
    end
    
      
 



end
