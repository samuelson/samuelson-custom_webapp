# This example configures just the reverse proxy. Note that
# manage_nginx is set to false, so that nginx can be configured
# here with non-default settings for the proxy buffers.

class { 'custom_webapp::web':
  manage_nginx  => false,
  webserver_url => 'appserver.example.com',
}
class { 'nginx':
  proxy_buffers => '64 4k',
  proxy_buffer_size => '16k',
}
