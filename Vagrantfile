Vagrant.configure("2") do |config|
  config.vm.box = "centos/7"
  config.vm.box_check_update = false
  config.vm.box_version = "2004.01"

  config.vm.provider "virtualbox" do |vb|
    vb.gui = false
    vb.cpus = 2
    vb.memory = "2048"
  end
  
  # VM CentOS 1
  config.vm.define "j1" do |j1|
    j1.vm.hostname = "j1.local"
    j1.vm.network :private_network, ip: "192.168.60.4"
    j1.vm.network "forwarded_port", guest: 8080, host: 8080
    j1.vm.provision "shell" do |shell|
      shell.path = "jenkins.sh"
    end
  end

  # VM CentOS 2
  config.vm.define "j2" do |j2|
    j2.vm.hostname = "j2.local"
    j2.vm.network :private_network, ip: "192.168.60.5"
    j2.vm.network "forwarded_port", guest: 9000, host: 9000
    j2.vm.provision "shell" do |shell|
      shell.path = "sonarqube.sh"
    end
  end

end