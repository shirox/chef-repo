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

%w{php70 php70-php-mbstring php70-php-mysqlnd}.each do |pkg|
  package pkg do
    action :install
  end
end
