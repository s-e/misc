case node['platform']
when "centos", "redhat", "fedora", "scientific"
when "debian", "ubuntu"
  package "percona-server-common-5.6" do
    action :install
  end
end
