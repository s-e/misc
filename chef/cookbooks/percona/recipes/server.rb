::Chef::Recipe.send(:include, Opscode::OpenSSL::Password)

include_recipe "percona::client"

node.set_unless['percona']['server_debian_password'] = secure_password
node.set_unless['percona']['server_root_password']   = secure_password
node.set_unless['percona']['server_repl_password']   = secure_password

if platform?(%w{debian ubuntu})

  directory "/var/cache/local/preseeding" do
    owner "root"
    group node['percona']['root_group']
    mode 0755
    recursive true
  end

  execute "preseed percona-server-server" do
    command "debconf-set-selections /var/cache/local/preseeding/mysql-server.seed"
    action :nothing
  end

  template "/var/cache/local/preseeding/mysql-server.seed" do
    source "mysql-server.seed.erb"
    owner "root"
    group node['percona']['root_group']
    mode "0600"
    notifies :run, resources(:execute => "preseed percona-server-server"), :immediately
  end

  template "#{node['percona']['conf_dir']}/debian.cnf" do
    source "debian.cnf.erb"
    owner "root"
    group node['percona']['root_group']
    mode "0600"
  end
end

package node['percona']['package_name'] do
  action :install
end

#directory node['mysql']['confd_dir'] do
#  owner "mysql" unless platform? 'windows'
#  group "mysql" unless platform? 'windows'
#  action :create
#  recursive true
#end

service "mysql" do
  service_name node['percona']['service_name']
  if node['percona']['use_upstart']
    restart_command "restart mysql"
    stop_command "stop mysql"
    start_command "start mysql"
  end
  supports :status => true, :restart => true, :reload => true
  action :nothing
end

skip_federated = case node['platform']
                 when 'fedora', 'ubuntu', 'amazon'
                   true
                 when 'centos', 'redhat', 'scientific'
                   node['platform_version'].to_f < 6.0
                 else
                   false
                 end

template "#{node['percona']['conf_dir']}/my.cnf" do
  source "my.cnf.erb"
  owner "root" unless platform? 'windows'
  group node['percona']['root_group'] unless platform? 'windows'
  mode "0644"
  notifies :restart, resources(:service => "mysql"), :immediately
  variables :skip_federated => skip_federated
end

grants_path = node['percona']['grants_path']

begin
  t = resources("template[#{grants_path}]")
rescue
  Chef::Log.info("Could not find previously defined grants.sql resource")
  t = template grants_path do
    source "grants.sql.erb"
    owner "root" unless platform? 'windows'
    group node['percona']['root_group'] unless platform? 'windows'
    mode "0600"
    action :create
  end
end

if platform?(%w{debian ubuntu})

  execute "mysql-install-privileges" do
    command "\"#{node['percona']['mysql_bin']}\" -u root #{node['percona']['server_root_password'].empty? ? '' : '-p' }\"#{node['percona']['server_root_password']}\" < \"#{grants_path}\""
    action :nothing
    subscribes :run, resources("template[#{grants_path}]"), :immediately
  end

end
