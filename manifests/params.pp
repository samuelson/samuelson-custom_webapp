# The params class is used in most modules. It gives an
# easy way to see all of the defaults that are avaliable.
# Putting all of thse in one place means you can easily
# change a default across your entire module by changing
# this file.
# The other classes in thie module use the "inherits"
# keyword to inherit the values set in this class.
class custom_webapp::params {
  $db_url = '127.0.0.1:3306'
  $db_username = 'root'
  $db_password = 'password'
  $appserver_port = '8080'
  $webserver_port = 80
}
