execute "upgrade phpunit" do
  command "pear upgrade PEAR"
  action :run
end
