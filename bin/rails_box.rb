class RailsBox

  def RailsBox.configure(config, settings)

    # Setup our box
    config.vm.box = "ubuntu/trusty64"
    config.vm.hostname = "rails-box"

    # Networking
    config.vm.network :forwarded_port, host: 3000, guest: 3000
    config.vm.network :forwarded_port, host: 4000, guest: 80

    # Provision
    config.vm.provision :shell, privileged: false, :path => "provision"

    # Configure A Few VirtualBox Settings
    config.vm.provider "virtualbox" do |vb|
      settings["vm-config"].each do |config|
          vb.customize ["modifyvm", :id, "--memory", config["memory"] ||= "2048"]
          vb.customize ["modifyvm", :id, "--cpus", config["cpus"] ||= "1"]
      end

      # vb.customize ["modifyvm", :id, "--natdnsproxy1", "on"]
      # vb.customize ["modifyvm", :id, "--natdnshostresolver1", "on"]
    end

    # Configure The Public Key For SSH Access
    config.vm.provision "shell" do |s|
      s.inline = "echo $1 | tee -a /home/vagrant/.ssh/authorized_keys"
      s.args = [File.read(settings["authorize"])]
    end

    # Copy The SSH Private Keys To The Box
    settings["keys"].each do |key|
      config.vm.provision "shell" do |s|
        s.privileged = false
        s.inline = "echo \"$1\" > /home/vagrant/.ssh/$2 && chmod 600 /home/vagrant/.ssh/$2"
        s.args = [File.read(key), key.split('/').last]
      end
    end

    # Copy The Bash Aliases
    config.vm.provision "shell" do |s|
      s.inline = "cp /vagrant/aliases /home/vagrant/.bash_aliases"
    end

    # Register All Of The Configured Shared Folders
    settings["folders"].each do |folder|
      config.vm.synced_folder folder["map"], folder["to"]
    end

  end
end