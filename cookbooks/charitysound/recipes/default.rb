#
# Cookbook Name:: charitysound
# Recipe:: default
#
# Copyright (C) 2013 YOUR_NAME
# 
# All rights reserved - Do Not Redistribute
#

# ----------------------------------- #
# => Packages                         #
# ----------------------------------- #

package "php5-mysql" do
  action :install
end

package "php5-curl" do
  action :install
end

package "php5-mcrypt" do
  action :install
end

# ----------------------------------- #
# => Apache                           #
# ----------------------------------- #

include_recipe "apache2"

web_app "backend" do
  server_name "backend.charitysound.dev"
  docroot "/var/www/backend/public"
end

# ----------------------------------- #
# => PHP                              #
# ----------------------------------- #

directory "/etc/php5/apache2" do
  owner "root"
  group "root"
  mode "0755"
  action :create
end

template "/etc/php5/apache2/php.ini" do
  source "php.ini.erb"
  owner "root"
  group "root"
  mode "0644"
end

# ----------------------------------- #
# => Database                         #
# ----------------------------------- #

include_recipe "mysql::server"
include_recipe "database::mysql"

mysql_database 'backend' do
  connection ({
		:host => "localhost",
		:username => 'root',
		:password => node['mysql']['server_root_password']
	})
  action :create
end

# ----------------------------------- #
# => Composer                         #
# ----------------------------------- #

include_recipe "chef-composer"

# ----------------------------------- #
# => Scripts                          #
# ----------------------------------- #

template "/usr/local/bin/chweb" do
  source "chweb.erb"
  owner "root"
  group "staff"
  mode "0755"
end