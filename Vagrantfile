# -*- mode: ruby -*-
# vi: set ft=ruby :

# All Vagrant configuration is done below. The "2" in Vagrant.configure
# configures the configuration version (we support older styles for
# backwards compatibility). Please don't change it unless you know what
# you're doing.
#disk2 = 'd:\\vm-disks\\disk-2.vdi'


Vagrant.configure("2") do |config|

  hostname = "ubuntu.box"
  locale = "en_GB.UTF.8"
  config.vm.box = "hashicorp/bionic64"
  config.vm.box_check_update = false
  #config.vm.provision "file", source: "~/.ssh/", destination: "~/.ssh-host"
    
  config.vm.provider "virtualbox" do |v|
    #v.name = "vagrant_ubuntu18_vb"
    v.memory = 2048*4
    v.cpus = 4

    #  unless File.exist?(disk2)
    #    v.customize ['createhd', '--filename', disk2, '--size', 10 * 1024] ## 100G
    #   end
    #    v.customize ['storageattach', :id, '--storagectl', 'SATA Controller', '--port', 1, '--device', 0, '--type', 'hdd', '--medium', disk2]
   
  end


  config.trigger.after :up do |trigger|
    trigger.name = "Finished Message"
    trigger.info = "Machine is up!"
    # trigger.run_remote = {inline: " mkdir -p /home/vagrant/d2;sudo mount /dev/sdb1 d2;
    # sudo chown  vagrant:vagrant -R /home/vagrant/d2;
    #  ln -sf /home/vagrant/d2/.zshhistory /home/vagrant/.zsh_history;
    #  ln -sf /home/vagrant/d2/.kube /home/vagrant/.kube"}
  end

  config.trigger.before :up do |trigger|
    trigger.info = "Machine starting!"
    trigger.ignore = [:destroy, :halt]
  end
  config.trigger.before [:halt, :destroy] do |trigger|
    trigger.info = "Ignoring halt"
    trigger.ignore = [:destroy, :halt]
  end

  config.vm.boot_timeout =600

  config.vm.provision :shell, :inline => "hostnamectl set-hostname #{hostname} && locale-gen #{locale}"
  config.vm.provision :shell, :inline => "apt-get update --fix-missing"
  config.vm.provision :shell, :inline => "apt-get install -y python3-pip "
  config.vm.provision :shell, :inline => "sudo apt-add-repository --yes  ppa:ansible/ansible"
  config.vm.provision :shell, :inline => "apt-get install -q -y ansible "
  
  

  config.vm.network "public_network"

    # Run Ansible from the Vagrant VM
  config.vm.provision "ansible_local" do |ansible_main|
      ansible_main.inventory_path = "./playbooks/hosts.ini"
      ansible_main.playbook = "./playbooks/main.yaml"
  end




 
      
 



end
