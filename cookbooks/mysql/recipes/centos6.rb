#
# Cookbook Name:: mysql
# Recipe:: default
#
# Copyright 2017, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#

remote_file "#{Chef::Config[:file_cache_path]}/mysql-community-release-el6-5.noarch.rpm" do
  source 'http://repo.mysql.com/mysql-community-release-el6-5.noarch.rpm'
  action :create
end

rpm_package "mysql-community-release" do
  source "#{Chef::Config[:file_cache_path]}/mysql-community-release-el6-5.noarch.rpm"
  action :install
end

# install mysql community server
yum_package "mysql-community-server" do
  action :install
end

service "mysqld" do
  supports :status => true, :restart => true, :reload => true
  action [ :enable, :start ]
end

execute "set mysql root password" do
  command "mysqladmin -uroot password #{node['mysql']['root_password']}"
  only_if "mysql -uroot -e 'show databases;'"
end
