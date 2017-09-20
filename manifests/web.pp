# This class configures an nginx reverse proxy webserver to
# forward traffic from port 80 (or another port) to the port 
# that the custom_webapp is running on.

class custom_webapp::web (
  $manage_nginx = true,
  $webserver_port = $custom_webapp::params::webserver_port,
  $appserver_url = '127.0.0.1',
  $appserver_port = $custom_webapp::params::appserver_port,
) inherits custom_webapp::params {

  # A module should only manage a single thing rather than 
  # all of the configuration for a system. Setting "manage_nginx"
  # to false would let you configure the base nginx server 
  # somewhere else in your puppet code.
  if $manage_nginx {
    include nginx    
  } 

  # This resource configures a reverse proxy. Note how the name
  # of the resource is set to $fqdn. This is on of the facts that
  # the Puppet agent provides to the master. $fqdn will resolve to
  # the fully qualified domain name of the node.
  nginx::resource::server { $fqdn:
    listen_port => $webserver_port,
    proxy     => "http://${appserver_url}:${appserver_port}",
  }
}
