# # encoding: utf-8

# Inspec test for recipe scalable_web_app::default

# The Inspec reference, with examples and extensive documentation, can be
# found at http://inspec.io/docs/reference/resources/

unless os.windows?
  # This is an example test, replace with your own test.
  describe user('root'), :skip do
    it { should exist }
  end
end

# This is an example test, replace it with your own test.
describe port(8080),  do
  it { should be_listening }
end

# # encoding: utf-8

# Inspec test for recipe webserver::default

# The Inspec reference, with examples and extensive documentation, can be
# found at http://inspec.io/docs/reference/resources/

unless os.windows?
  # This is an example test, replace with your own test.
  describe user('root') do
    it { should exist }
  end
end

describe package('apache2') do
  it { should be_installed }
end


describe command('systemctl status apache2') do
  its('exit_status') { should eq 0 }
end



describe file('/var/www/html/index.html') do
  it { should exist }
  it { should be_file }
  its('content') { should match /[hH]ello [Ww]orld!/ }
end

describe command('curl http://localhost') do
  its('stdout') { should match /Moved Permanently/ }
end

describe command('curl -k https://localhost') do
  its('stdout') { should match /[Hh]ello [Ww]orld!/ }
end

describe port(22) do
  it { should be_listening }
  its('processes') { should include 'sshd' }
  its('protocols') { should include 'tcp' }
  its('addresses') { should include '0.0.0.0' }
end
describe port(80) do
  it { should_not be_listening }
  its('protocols') { should include 'tcp6' }
  its('addresses') { should include '::' }
end
describe port(443) do
  it { should be_listening }
  its('protocols') { should include 'tcp6' }
  its('addresses') { should include '::' }
end
