#
# Cookbook Name:: php
# Recipe:: default
#
# Copyright 2017, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#

%w{php56 php56-mbstring php56-mysqlnd uuid-php56}.each do |pkg|
  package pkg do
    action :install
  end
end
