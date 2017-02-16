#
# Cookbook Name:: httpd
# Recipe:: default
#
# Copyright 2017, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#

package "httpd24" do
  action :install
end

template "/etc/httpd/conf.d/vhost.conf" do
  source "vhost.conf.erb"
  group "root"
  owner "root"
  mode "0644"
end

service "httpd" do
  supports :status => true, :restart => true
  action [:enable, :start]
end
