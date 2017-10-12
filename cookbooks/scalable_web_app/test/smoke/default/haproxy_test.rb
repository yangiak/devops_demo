# # encoding: utf-8

# Inspec test for recipe scalable_web_app::haproxy

# The Inspec reference, with examples and extensive documentation, can be
# found at http://inspec.io/docs/reference/resources/

unless os.windows?
  # This is an example test, replace with your own test.
  describe user('root'), :skip do
    it { should exist }
  end
end

# This is an example test, replace it with your own test.
describe port(80) do
  it { should be_listening }
end
describe port(443) do
  it { should be_listening }
end

describe package('haproxy') do
  it { should be_installed }
end

describe file('/usr/var/ssl/certs/server.crt') do
    it { should exist }
end

describe command('systemctl status haproxy') do
  its('exit_status') { should eq 0 }
end