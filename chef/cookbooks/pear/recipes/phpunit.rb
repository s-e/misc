execute "discover phpunit" do
  command "pear channel-discover pear.phpunit.de"
  action :run
end

execute "config phpunit" do
  command "pear config-set auto_discover 1"
  action :run
end

execute "install phpunit" do
  command "pear install pear.phpunit.de/PHPUnit"
  action :run
end
