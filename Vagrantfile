# -*- mode: ruby -*-
# vi: set ft=ruby :

#require "#{File.dirname(__FILE__)}/vagrant/artisan.rb"
#require "#{File.dirname(__FILE__)}/vagrant/composer.rb"

Vagrant::Config.run do |config|
    config.vm.define :laravel4 do |lv4_config|
        lv4_config.vm.box = "precise32"
        lv4_config.vm.box_url = "http://files.vagrantup.com/precise32.box"
        #lv4_config.vm.customize ["modifyvm", :id, "--rtcuseutc", "on"]
        lv4_config.ssh.max_tries = 10
        lv4_config.vm.forward_port 80, 55555
        lv4_config.vm.forward_port 3306, 55556
        lv4_config.vm.forward_port 5432, 55557
        lv4_config.vm.host_name = "laravel.local"
        lv4_config.vm.share_folder("www", "/var/www", "./www", :extra => 'dmode=777,fmode=777')
        lv4_config.vm.provision :shell, :inline => "echo \"Asia/Tokyo\" | sudo tee /etc/timezone && dpkg-reconfigure --frontend noninteractive tzdata"
        lv4_config.vm.provision :shell, :inline => "apt-get update --fix-missing"
        lv4_config.vm.provision :puppet do |puppet|
            puppet.manifests_path = "puppet/manifests"
            puppet.manifest_file  = "phpbase.pp"
            puppet.module_path = "puppet/modules"
            #puppet.options = "--verbose --debug"
            #puppet.options = "--verbose"
        end

        lv4_config.vm.provision :shell, :path => "puppet/scripts/enable_remote_mysql_access.sh"

        lv4_config.vm.provision :shell, :path => "mySetup.sh"
    end
end
