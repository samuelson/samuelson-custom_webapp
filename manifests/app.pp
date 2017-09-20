# This class configures the webapp itself. It takes
# several parameters which specifiy how to get to the
# database backend and what port the app should run on.
# Notice how this class has a Package, File, and Service
# resource. This is a very common pattern in Puppet code.

class custom_webapp::app (
  $db_url = $custom_webapp::params::db_url,
  $db_username = $custom_webapp::params::db_username,
  $db_password = $custom_webapp::params::db_password,
  $web_port = $custom_webapp::params::web_port,
) inherits custom_webapp::params {
  
  # This package installs the app itself. Since this app
  # is just used for this course, we're including it in the
  # module itself, but normally it would come from the public
  # yum repositories or from a url. It's actually bad practice 
  # to include a file like this inside a module, but we're doing
  # it for convenience here.
  package {'custom_webapp':
    ensure => present,
    source => 'puppet:///modules/custom_webapp/custom_webapp-0.1.0-1.x86_64.rpm',
  }

  # This file resource uses an epp template, which is a Puppet
  # specific dynamic file format. This allows you to pass in
  # values that will be included in the config file. In this case
  # we're just passing the class parameters through, but often
  # a module will have some complex logic for how it creates config
  # files. This is part of what makes Puppet so powerful. You don't
  # need to learn every config file format for all your applications
  # instead you can let the module authors figure that out and just
  # set the parameters in your puppet code.
  file {'/etc/custom_webapp/config.yaml':
    ensure          => file,
    content         => epp('custom_webapp/config.yaml.epp', {
        db_url      => $db_url,
        db_username => $db_username,
        db_password => $db_password,
        web_port    => $web_port,
      }),
    require => Package['custom_webapp']
  }

  # This resource makes sure that the custom_webapp service is
  # running and enabled at boot. The "require" parameter. That
  # to keep puppet from getting these out of order and trying to
  # start the service before it's config file is set up.
  # Puppet usually follows the order specified in a manifest, but
  # sometimes things are put into a different order as it builds a
  # model of the desired state. This is one of the most difficult
  # concepts for beginners, just remember that we're building a model
  # not writing a list of instructions. Once Puppet has the model,
  # it will figure out the most efficient order to manage to configure
  # the resources.
  service {'custom_webapp':
    ensure  => running,
    enable  => true,
    require => File['/etc/custom_webapp/config.yaml'],
  }
}
