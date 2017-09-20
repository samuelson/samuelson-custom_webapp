# This class configures the mysql server backend for
# custom_webapp. It has parameters for the username and
# password to use for the mysql database.
# Note: This is just plain text and will show up in your
# logs there are more secure ways of dealing with passwords
# in Puppet, but they're a little beyond the scope of this
# course.

class custom_webapp::db (
  $manage_mysql_server = true,
  $db_username = $custom_webapp::params::db_username,
  $db_password = $custom_webapp::params::db_password,
){
  # A module should only manage a single thing rather than
  # all of the configuration for a system. Setting "manage_mysql_server"
  # to false would let you configre the base mysql server somewhere else
  # in your puppet code.
  if $manage_mysql_server { 
    class {'mysql::server':
      root_password => $mysql_server_password,
      before        => Mysql::DB['pages'],
    }
  }
  mysql::db {'pages':
    user     => $mysql_server_user,
    password => $mysql_server_password,
    host     => '%',
    grant    => ['ALL'],
  }

  # The code below isn't somthing you would do in a real
  # world application, it just sets up some records in
  # the mysql database so that the webapp has something
  # to display.

  # The file resource has the notify parameter set. This
  # means that any time this file changes it will trigger the
  # 'setup database' exec resource.
  file { '/etc/custom_webapp/starter.sql':
    ensure => file,
    source => 'puppet:///modules/custom_webapp/starter.sql',
    notify => Exec['setup database'],
  }
  # We haven't talked much about exec resourcess, it's a way of telling
  # Puppet to run an arbitrary shell command. Execs are useful
  # but are best used very sparingly. Remember, Puppet code should
  # be able to run multiple times without repeating actions.
  # Once a change has been made by an exec, there needs to be
  # something that prevents it from triggering on the next puppet run
  # in this case, it's the "refreshonly" parameter. This parameter tells
  # the exec to only trigger if it's receieved a "notify" event from another
  # resource.
  exec { 'setup database':
    command     => 'mysql -uroot -ppassword pages < /etc/custom_webapp/starter.sql',
    path        => '/usr/bin/',
    refreshonly => true,
  }
}
