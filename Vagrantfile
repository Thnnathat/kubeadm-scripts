Vagrant.configure("2") do |config|
  config.vm.provision "shell", inline: <<-SHELL
      apt-get update -y
      echo "10.0.0.10  master-node" >> /etc/hosts
      echo "10.0.0.11  worker-node1" >> /etc/hosts
      echo "10.0.0.12  worker-node2" >> /etc/hosts
  SHELL
  
  config.vm.define "master" do |master|
    master.vm.box = "bento/ubuntu-22.04"
    master.vm.hostname = "master-node"
    master.vm.network "private_network", ip: "10.0.0.10"
    master.vm.provider "virtualbox" do |vb|
        vb.memory = 8192
        vb.cpus = 4
    end
    master.vm.provision "shell", path: "scripts/common.sh"  
    master.vm.provision "shell", path: "scripts/master.sh"  
  end

  (1..2).each do |i|

  config.vm.define "node#{i}" do |node|
    node.vm.box = "bento/ubuntu-22.04"
    node.vm.hostname = "worker-node#{i}"
    node.vm.network "private_network", ip: "10.0.0.1#{i}"
    node.vm.provider "virtualbox" do |vb|
        vb.memory = 4096
        vb.cpus = 3
    end
    node.vm.provision "shell", path: "scripts/common.sh"  
  end
  
  end
end