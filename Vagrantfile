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
  #config.vm.synced_folder "~/my-settings/", "/home/vagrant/my-settings",type:"nfs"
  config.vm.synced_folder "d:\\vbhome.", "/homeonhost", type: "nfs"
    
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

  
  
  

  #config.vm.provision "file", source: "~/.ssh/vinay-wsl-git", destination: "~/.ssh/git"
  #config.vm.provision "shell", 
    #path: "provision/script.sh",privileged: true
 
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


  # Disable automatic box update checking. If you disable this, then
  # boxes will only be checked for updates when the user runs
  # `vagrant box outdated`. This is not recommended.
  # config.vm.box_check_update = false

  # Create a forwarded port mapping which allows access to a specific port
  # within the machine from a port on the host machine. In the example below,
  # accessing "localhost:8080" will access port 80 on the guest machine.
  # NOTE: This will enable public access to the opened port
  # config.vm.network "forwarded_port", guest: 80, host: 8080

  # Create a forwarded port mapping which allows access to a specific port
  # within the machine from a port on the host machine and only allow access
  # via 127.0.0.1 to disable public access
  # config.vm.network "forwarded_port", guest: 80, host: 8080, host_ip: "127.0.0.1"

  # Create a private network, which allows host-only access to the machine
  # using a specific IP.
  # config.vm.network "private_network", ip: "192.168.33.10"

  # Create a public network, which generally matched to bridged network.
  # Bridged networks make the machine appear as another physical device on
  # your network.
  config.vm.network "public_network"

  # Share an additional folder to the guest VM. The first argument is
  # the path on the host to the actual folder. The second argument is
  # the path on the guest to mount the folder. And the optional third
  # argument is a set of non-required options.
  # config.vm.synced_folder "../data", "/vagrant_data"

  # Provider-specific configuration so you can fine-tune various
  # backing providers for Vagrant. These expose provider-specific options.
  # Example for VirtualBox:
  #
 


 
    # Run Ansible from the Vagrant VM
    config.vm.provision "ansible_local" do |ansible|
      ansible.inventory_path = "hosts.ini"
      ansible.playbook = "playbook.yaml"
     # ansible.install_mode = "pip"
    end
      
 



end
