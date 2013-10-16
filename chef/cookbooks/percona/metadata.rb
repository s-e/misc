maintainer        "Thijs Lensselink"
maintainer_email  "tl@lenss.nl"
license           "Apache 2.0"
description       "Installs and maintains percona"
version           "0.1"

%w{ debian ubuntu }.each do |os|
  supports os
end

recipe "percona", "Installs percona-server-common-5.6"
recipe "percona::common", "Installs percona-server-common-5.6"
recipe "percona::client", "Installs percona-server-client-5.6"
recipe "percona::server", "Installs percona-server-server-5.6"

attribute "mysql/server_root_password",
  :display_name => "MySQL Server Root Password",
  :description => "Randomly generated password for the mysqld root user",
  :default => "randomly generated"

attribute "mysql/bind_address",
  :display_name => "MySQL Bind Address",
  :description => "Address that mysqld should listen on",
  :default => "ipaddress"

attribute "mysql/data_dir",
  :display_name => "MySQL Data Directory",
  :description => "Location of mysql databases",
  :default => "/var/lib/mysql"

attribute "mysql/conf_dir",
  :display_name => "MySQL Conf Directory",
  :description => "Location of mysql conf files",
  :default => "/etc/mysql"

attribute "mysql/ec2_path",
  :display_name => "MySQL EC2 Path",
  :description => "Location of mysql directory on EC2 instance EBS volumes",
  :default => "/mnt/mysql"

attribute "mysql/tunable",
  :display_name => "MySQL Tunables",
  :description => "Hash of MySQL tunable attributes",
  :type => "hash"

attribute "mysql/tunable/key_buffer",
  :display_name => "MySQL Tuntable Key Buffer",
  :default => "250M"

attribute "mysql/tunable/max_connections",
  :display_name => "MySQL Tunable Max Connections",
  :default => "800"

attribute "mysql/tunable/wait_timeout",
  :display_name => "MySQL Tunable Wait Timeout",
  :default => "180"

attribute "mysql/tunable/net_read_timeout",
  :display_name => "MySQL Tunable Net Read Timeout",
  :default => "30"

attribute "mysql/tunable/net_write_timeout",
  :display_name => "MySQL Tunable Net Write Timeout",
  :default => "30"

attribute "mysql/tunable/back_log",
  :display_name => "MySQL Tunable Back Log",
  :default => "128"

attribute "mysql/tunable/table_cache",
  :display_name => "MySQL Tunable Table Cache for MySQL < 5.1.3",
  :default => "128"

attribute "mysql/tunable/table_open_cache",
  :display_name => "MySQL Tunable Table Cache for MySQL >= 5.1.3",
  :default => "128"

attribute "mysql/tunable/max_heap_table_size",
  :display_name => "MySQL Tunable Max Heap Table Size",
  :default => "32M"

attribute "mysql/tunable/expire_logs_days",
  :display_name => "MySQL Exipre Log Days",
  :default => "10"

attribute "mysql/tunable/max_binlog_size",
  :display_name => "MySQL Max Binlog Size",
  :default => "100M"

attribute "mysql/client",
  :display_name => "MySQL Connector/C Client",
  :description => "Hash of MySQL client attributes",
  :type => "hash"

attribute "mysql/client/version",
  :display_name => "MySQL Connector/C Version",
  :default => "6.0.2"

attribute "mysql/client/arch",
  :display_name => "MySQL Connector/C Architecture",
  :default => "win32"

attribute "mysql/client/package_file",
  :display_name => "MySQL Connector/C Package File Name",
  :default => "mysql-connector-c-6.0.2-win32.msi"

attribute "mysql/client/url",
  :display_name => "MySQL Connector/C Download URL",
  :default => "http://www.mysql.com/get/Downloads/Connector-C/mysql-connector-c-6.0.2-win32.msi/from/http://mysql.mirrors.pair.com/"

attribute "mysql/client/package_name",
  :display_name => "MySQL Connector/C Registry DisplayName",
  :default => "MySQL Connector C 6.0.2"

attribute "mysql/client/basedir",
  :display_name => "MySQL Connector/C Base Install Directory",
  :default => "C:\\Program Files (x86)\\MySQL\\Connector C 6.0.2"

attribute "mysql/client/lib_dir",
  :display_name => "MySQL Connector/C Library Directory (containing libmysql.dll)",
  :default => "C:\\Program Files (x86)\\MySQL\\Connector C 6.0.2\\lib\\opt"

attribute "mysql/client/bin_dir",
  :display_name => "MySQL Connector/C Executable Directory",
  :default => "C:\\Program Files (x86)\\MySQL\\Connector C 6.0.2\\bin"

attribute "mysql/client/ruby_dir",
  :display_name => "Ruby Executable Directory which should gain MySQL support",
  :default => "system ruby"
