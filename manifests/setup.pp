# Class to configure package management and other services required extremely
# early in the initialisation phase.
class base::setup(
  $http_proxy  = $base::params::http_proxy,
  $apt_sources = $base::params::apt_sources,
  $yum_sources = $base::params::yum_sources,
) inherits base::params {
  # Don't do any of this in bootstrap mode.
  if $::bootstrap_puppetmaster { } else {
    # Override locals with their global counterpart.
    if $::http_proxy  { $base_http_proxy  = $::http_proxy  } else { $base_http_proxy  = $http_proxy  }
    if $::apt_sources { $base_apt_sources = $::apt_sources } else { $base_apt_sources = $apt_sources }
    if $::yum_sources { $base_yum_sources = $::yum_sources } else { $base_yum_sources = $yum_sources }

    if $base_http_proxy != 'UNDEFINED' {
      ### This file should not be managed in its entirety
      file { "/etc/environment":
	ensure  => file,
	content => template('base/environment.erb');
      }

      if $::osfamily == 'Debian' {
	class { "apt::proxy":
	  proxy_url => $base_http_proxy,
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

    if $::osfamily == 'Debian' {
      if $base_apt_sources != 'UNDEFINED' {
	class { "apt::source::collection":
	  collection => $base_apt_sources;
	}
      }
    }
  }
}
