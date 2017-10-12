#
# Cookbook:: scalable_web_app
# Recipe:: default
#
# Copyright (c) 2016 The Authors, All Rights Reserved.
apt_update 'Update the apt cache daily' do
  frequency 86_400
  action :periodic
end

package 'apache2'

service 'apache2' do
	supports status: true, restart: true, reload: true
  action [:enable, :start]
end

group 'web_admin'

user 'web_admin' do
  group 'web_admin'
  system true
  shell '/bin/bash'
end

template '/etc/apache2/ports.conf' do
  source 'ports.conf.erb'
  owner 'root'
  group 'root'
  variables({
    :listen_port => node['apache2']['port']
    })
  notifies :reload, 'service[apache2]'
end

template '/var/www/html/index.html' do # ~FC033
  source 'index.html.erb'
  owner 'web_admin'
  group 'web_admin'
end

