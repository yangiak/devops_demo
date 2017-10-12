require 'chef/provisioning'
require 'chef/provisioning/aws_driver'
 
with_machine_options ({
	:bootstrap_options => {
    :image_id => 'ami-10547475',
    :key_name => 'chef-devops-demo',
    :instance_type => 't2.micro',
    :associate_public_ip_address => true,
    :security_group_ids => 'sg-81ed6de9',
    :subnet_id => 'subnet-2b1e6b42'
  },
  :convergence_options => {
  	:chef_client_timeout => 120*60,
 	  :client_name => Chef::Config[:node_name],
  	:signing_key_filename => Chef::Config[:client_key]
 	}
})


num_instances = 2

1.upto(num_instances) do |inst|
	machine "new-apache-#{inst}" do 
		# recipe 'learn_chef_apache2::default'
    recipe 'scalable_web_app::default'
    # recipe 'scalable_web_app::haproxy'
		# action :destroy
	end
end

machine 'haproxy' do 
  recipe 'scalable_web_app::haproxy'
end