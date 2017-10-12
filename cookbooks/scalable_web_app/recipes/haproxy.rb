#
# Cookbook:: scalable_web_app
# Recipe:: haproxy
#
# Copyright:: 2017, The Authors, All Rights Reserved.
require 'pry'
apt_update

package 'haproxy'

group 'haproxy'

user 'haproxy' do
  group 'haproxy'
  system true
  shell 'nologin'
end

directory node['selfsigned_certificate']['destination'] do
    owner "root"
    group "root"
    mode 0755
    action :create
    recursive true
end

remote_directory node['selfsigned_certificate']['destination'] do
  source 'certs'
  files_owner 'root'
  files_group 'root'
  files_mode 00644
  owner 'root'
  group 'root'
  mode 0755
end

template "/etc/haproxy/haproxy.cfg" do
  source "haproxy.cfg.erb"
  owner "haproxy"
  group "haproxy"
  variables({
    backend_nodes: search(:node, 'recipes:scalable_web_app\:\:default',
    :filter_result => { 'name' => [ 'name' ],
    'ip' => [ 'ipaddress' ],
    }),
    certs: node['ssl_cert']['source']

  })
  # binding.pry
  notifies :reload, 'service[haproxy]'
end


service "haproxy" do
  supports status: true, restart: true, reload: true
  action [ :enable, :start ]
end