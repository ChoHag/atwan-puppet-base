# Placeholder for any configuration required before package management or
# puppet are set up.

class base::setup(
  $http_proxy = $base::params::http_proxy
) inherits base::params {
  # A resource for the sake of having a resource
  file { "/root":
    ensure => directory,
    owner  => 'root',
    group  => 'root',
    mode   => '0700';
  }

  if $http_proxy != 'UNDEFINED' {
    ### This file should not be managed in its entirety
    file { "/etc/environment":
      ensure  => file,
      content => template('base/environment.erb');
    }

    if $::osfamily == 'Debian' {
      class { "apt::proxy":
	proxy_url => $http_proxy,
      }
    }

  } else {
    file { "/etc/environment":
      ensure  => file,
      content => '';
    }

    if $::osfamily == 'Debian' {
      class { "apt::proxy":
	proxy_url => '',
      }
    }
  }
}
