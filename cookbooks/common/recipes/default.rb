#
# Cookbook Name:: common
# Recipe:: default
#
# Copyright 2017, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#

package "git" do
  action :install
end

directory "/root/.ssh" do
  owner "root"
  group "root"
  mode "0600"
  action :create
end

template "/root/.ssh/config" do
  source "ssh_config.erb"
  owner "root"
  group "root"
  mode "0600"
end
