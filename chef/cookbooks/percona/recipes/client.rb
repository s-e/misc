::Chef::Recipe.send(:include, Opscode::Mysql::Helpers)

case node['platform']
when "centos", "redhat", "fedora", "scientific"
when "debian", "ubuntu"
  package "percona-server-client-5.6" do
    action :install
  end
end

if platform?(%w{ redhat centos fedora suse scientific amazon })
  package 'ruby-mysql'
elsif platform?(%w{ debian ubuntu })
  package "libmysql-ruby"
else
  gem_package "mysql" do
    action :install
  end
end
