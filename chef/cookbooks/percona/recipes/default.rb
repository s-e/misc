bash "percona keys" do
  code <<-EOH
apt-key adv --keyserver keys.gnupg.net --recv-keys 1C4CBDCDCD2EFD2A
EOH
  action :run
end

execute "apt-get update" do
  action :nothing
end

cookbook_file "/etc/apt/sources.list.d/percona.list" do
  source "percona.list"
  mode 0644
  owner "root"
  group "root"
  notifies :run, resources(:bash => "percona keys", :execute => "apt-get update"), :immediately
end

include_recipe "percona::client"
