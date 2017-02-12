#
# Cookbook Name:: mysql
# Recipe:: default
#
# Copyright 2017, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#

remote_file "#{Chef::Config[:file_cache_path]}/mysql57-community-release-el6-8.noarch.rpm" do
  source "http://dev.mysql.com/get/mysql57-community-release-el6-8.noarch.rpm"
end

package "mysql57-community-release-el6-8.noarch.rpm" do
  action :install
  provider Chef::Provider::Package::Rpm
  source "#{Chef::Config[:file_cache_path]}/mysql57-community-release-el6-8.noarch.rpm"
end

package "mysql-community-server" do
  action :install
end

service "mysqld" do
  action [:enable, :start]
end

execute "set mysql root password" do
  command "mysqladmin -uroot password #{node['mysql']['root_password']}"
  only_if "mysql -uroot -e 'show databases;'"
end
