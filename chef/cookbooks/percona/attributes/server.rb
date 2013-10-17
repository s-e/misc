
default['percona']['bind_address']               = attribute?('cloud') ? cloud['local_ipv4'] : ipaddress

case node["platform"]
when "ubuntu", "debian"
  default['percona']['package_name']            = "percona-server-server-5.6"
  default['percona']['service_name']            = "mysql"
  default['percona']['basedir']                 = "/usr"
  default['percona']['data_dir']                = "/var/lib/mysql"
  default['percona']['root_group']              = "root"
  default['percona']['mysqladmin_bin']          = "/usr/bin/mysqladmin"
  default['percona']['mysql_bin']               = "/usr/bin/mysql"

  set['percona']['conf_dir']                    = '/etc/mysql'
  set['percona']['confd_dir']                   = '/etc/mysql/conf.d'
  set['percona']['socket']                      = "/var/run/mysqld/mysqld.sock"
  set['percona']['pid_file']                    = "/var/run/mysqld/mysqld.pid"
  set['percona']['old_passwords']               = 0
  set['percona']['grants_path']                 = "/etc/mysql/grants.sql"
end

default['percona']['use_upstart']                     = false
default['percona']['allow_remote_root']               = false
default['percona']['tunable']['back_log']             = "128"
default['percona']['tunable']['key_buffer']           = "256M"
default['percona']['tunable']['max_allowed_packet']   = "16M"
default['percona']['tunable']['max_connections']      = "800"
default['percona']['tunable']['max_heap_table_size']  = "32M"
default['percona']['tunable']['myisam_recover']       = "BACKUP"
default['percona']['tunable']['net_read_timeout']     = "30"
default['percona']['tunable']['net_write_timeout']    = "30"
default['percona']['tunable']['table_cache']          = "128"
default['percona']['tunable']['table_open_cache']     = "128"
default['percona']['tunable']['thread_cache']         = "128"
default['percona']['tunable']['thread_cache_size']    = 8
default['percona']['tunable']['thread_concurrency']   = 10
default['percona']['tunable']['thread_stack']         = "256K"
default['percona']['tunable']['wait_timeout']         = "180"

default['percona']['tunable']['query_cache_limit']    = "1M"
default['percona']['tunable']['query_cache_size']     = "16M"

default['percona']['tunable']['log_slow_queries']     = "/var/log/mysql/slow.log"
default['percona']['tunable']['long_query_time']      = 2

default['percona']['tunable']['expire_logs_days']     = 10
default['percona']['tunable']['max_binlog_size']      = "100M"

default['percona']['tunable']['innodb_buffer_pool_size']  = "256M"
