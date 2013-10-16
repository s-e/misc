bash "dotdeb keys" do
  code <<-EOH
wget http://www.dotdeb.org/dotdeb.gpg -O /tmp/dotdeb.gpg
cat /tmp/dotdeb.gpg | sudo apt-key add -
EOH
  action :run
end

execute "apt-get update" do
  action :nothing
end

cookbook_file "/etc/apt/sources.list.d/dotdeb.list" do
  source "dotdeb.list"
  mode 0644
  owner "root"
  group "root"
  notifies :run, resources(:bash => "dotdeb keys", :execute => "apt-get update"), :immediately
end
