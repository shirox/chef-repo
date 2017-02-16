#
# Cookbook Name:: la5test
# Recipe:: default
#
# Copyright 2017, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#

deploy "la5test" do
  repo "git@github.com:shirox/la5test.git"
  user "root"
  deploy_to "/var/www/la5test"
  action :deploy
end
