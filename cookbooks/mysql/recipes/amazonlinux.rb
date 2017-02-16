#
# Cookbook Name:: mysql
# Recipe:: default
#
# Copyright 2017, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#

%w{mysql56 mysql56-server}.each do |pkg|
  package pkg do
    action :install
  end
end

file "/etc/sysconfig/network" do
  content "NETWORKING=yes"
end

service "mysqld" do
  supports :status => true, :restart => true, :reload => true
  action [ :enable, :start ]
end

execute "set mysql root password" do
  command "mysqladmin -uroot password #{node['mysql']['root_password']}"
  only_if "mysql -uroot -e 'show databases;'"
end
