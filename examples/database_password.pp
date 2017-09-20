# This example configures the database to use a more
# secure password it also uses a custom configuration for
# for the mysql server, so it sets manage_mysql_server
# to false.
# Notice how the db password is set on both the app
# and the server. This is so that the app will have the
# proper credentials to connect to the database, since
# we're no longer using the default.

$server_password = 'P#3!2sdt5;)'

class {'custom::web_app::db':
  manage_mysql_server => false,
  db_password         => $server_password, 
}
class { 'mysql::server':
  root_password       => $server_password,
  install_secret_file => '/.mysql_secret_file',
}
class { 'custom_webapp::app':
  db_password => $server_password,
}
