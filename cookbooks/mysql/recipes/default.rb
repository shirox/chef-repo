#
# Cookbook Name:: mysql
# Recipe:: default
#
# Copyright 2017, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#

%w{rh-mysql57 rh-mysql57-mysql-server}.each do |pkg|
  package pkg do
    action :install
  end
end

service "mysqld" do
  action [:enable, :start]
end

execute "set mysql root password" do
  command "mysqladmin -uroot password #{node['mysql']['root_password']}"
  only_if "mysql -uroot -e 'show databases;'"
end
