$script = <<-SHELL
  apt-get update
	curl -L https://chef.io/chef/install.sh | sudo bash
SHELL

$ss = <<-SHELL
  knife supermarket install mysql;
SHELL

Vagrant.configure(2) do |config|

    config.vm.define "chefVM" do |chefVM|
        chefVM.ssh.insert_key = false
        chefVM.vm.box = "ubuntu/bionic64"
        chefVM.vm.network "private_network", ip: "192.168.33.10"
        chefVM.vm.provider "virtualbox" do |vb|
            vb.memory = "1024"
            vb.name = "chefVM"
        end
        
        chefVM.vm.provision "shell", inline: $script

        chefVM.vm.provision :chef_solo do |chef|
          chef.cookbooks_path = "chef-repo/cookbooks"
          chef.add_recipe "wordpress"
          chef.arguments = "--chef-license accept"
          end
    end
end
 