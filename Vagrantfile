# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure("2") do |config|

  config.vm.box = "wheezy64"
  config.vm.box_url = "http://puppet-vagrant-boxes.puppetlabs.com/debian-70rc1-x64-vbox4210.box"
  config.vm.network :private_network, ip: "192.168.0.37"
  config.vm.network :forwarded_port, guest: 80, host: 8080
  config.vm.network :forwarded_port, guest: 3306, host: 3306
  config.vm.synced_folder "./", "/var/www"

  config.vm.provision :chef_solo do |chef|
    chef.cookbooks_path = "cookbooks"
    chef.add_recipe "apt"
    chef.add_recipe "build-essential"
    chef.add_recipe "git"
    chef.add_recipe "php"
    chef.add_recipe "apache2"
    chef.add_recipe "apache2::mod_php5"
    chef.add_recipe "apache2::mod_rewrite"
    chef.add_recipe "mysql::server"
    chef.add_recipe "database"
    chef.add_recipe "nodejs"
    chef.add_recipe "chef-composer"
    chef.add_recipe "charitysound"
    chef.json = {
      :build_essential => {
        :compiletime => true
      },
      :mysql => {
        :allow_remote_root => true,
        :server_root_password => 'password',
        :server_debian_password => 'password',
        :server_repl_password => 'password'
      },
      :apache => {
        :user => 'vagrant',
        :group => 'vagrant',
        :default_site_enabled => true
      },
      :php => {
        :directives => {
          :upload_max_filesize => "128M"  
        }
      }
    }
  end
end
