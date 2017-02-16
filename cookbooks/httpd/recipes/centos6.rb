#
# Cookbook Name:: httpd
# Recipe:: default
#
# Copyright 2017, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#

package "centos-release-scl-rh" do
  action :install
end

package "httpd24" do
  version "1.1-14.el6"
  action :install
end

link "/etc/httpd" do
  to "/opt/rh/httpd24/root/etc/httpd"
end

link "/etc/init.d/httpd" do
  to "/etc/init.d/httpd24-httpd"
end

directory "/var/www" do
  owner "root"
  group "root"
  mode "0755"
  action :create
end

link "/var/www/html" do
  to "/opt/rh/httpd24/root/var/www/html"
end

directory "/var/log/httpd" do
  owner "root"
  group "root"
  mode "0755"
  action :create
end

file "/var/log/httpd/access_log" do
  owner "root"
  group "root"
  mode "0644"
  action :create
end

file "/var/log/httpd/error_log" do
  owner "root"
  group "root"
  mode "0644"
  action :create
end

template "/etc/httpd/conf/httpd.conf" do
  source "httpd.conf.erb"
  group "root"
  owner "root"
  mode "0644"
end

template "/etc/httpd/conf.d/vhost.conf" do
  source "vhost.conf.erb"
  group "root"
  owner "root"
  mode "0644"
end

service "httpd24-httpd" do
  supports :status => true, :restart => true
  action [:enable, :start]
end
