#
# Cookbook Name:: php
# Recipe:: default
#
# Copyright 2017, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#

package "epel-release" do
  action :install
end

remote_file "#{Chef::Config[:file_cache_path]}/remi-release-6.rpm" do
  source "http://rpms.famillecollet.com/enterprise/remi-release-6.rpm"
  not_if { ::File.exists?("#{Chef::Config[:file_cache_path]}/enterprise/remi-release-6.rpm") }
end

package "remi-release-6.rpm" do
  action :install
  provider Chef::Provider::Package::Rpm
  source "#{Chef::Config[:file_cache_path]}/remi-release-6.rpm"
end

package "php56" do
  version "2.1-5.el6.remi"
  action :install
end

%w{php56-php-mbstring php56-php-mysqlnd}.each do |pkg|
  package pkg do
    action :install
  end
end
