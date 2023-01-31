Vagrant.configure("2") do |config|
  config.vm.synced_folder "global/", "/home/vagrant/global"

  # Provisiing MongoDB
  config.vm.define "mongodb" do | mongodb |
    mongodb.vm.box = "starboard/ubuntu-arm64-20.04.5"
    mongodb.vm.synced_folder "env/mongodb", "/home/vagrant/env/mongodb"

    mongodb.vm.provider "vmware_desktop" do |v|
      v.gui = true
      v.vmx["ethernet0.virtualdev"] = "vmxnet3"
    end

    mongodb.vm.provision "shell", inline: <<-SHELL
      systemctl disable apt-daily.service
      systemctl disable apt-daily.timer
      sudo apt remove unattended-upgrades -y
    SHELL
    mongodb.vm.provision "shell", path: "env/mongodb/script.sh"
  end
  
  # Provisioning NodeJS App
  config.vm.define "nodeapp" do | nodeapp |
    nodeapp.vm.box = "starboard/ubuntu-arm64-20.04.5"
    config.vm.synced_folder "app/", "/home/vagrant/app"
    config.vm.synced_folder "env/nodeapp", "/home/vagrant/env/nodeapp"

    nodeapp.vm.box_version = "20221120.20.40.0"
    nodeapp.vm.box_download_insecure = true

    nodeapp.vm.hostname = "nology.training"
    nodeapp.hostsupdater.aliases = {
      '192.168.63.138' => "nology.training",
    }

    nodeapp.vm.provider "vmware_desktop" do |v|
        v.gui = true
        v.vmx["ethernet0.virtualdev"] = "vmxnet3"
    end

    nodeapp.vm.provision "shell", inline: <<-SHELL
      systemctl disable apt-daily.service
      systemctl disable apt-daily.timer
      sudo apt remove unattended-upgrades -y
    SHELL
    nodeapp.vm.provision "shell", path: "env/nodeapp/script.sh"
  end
end