class base::proxy {
  $http_proxy  = $base::setup::http_proxy

  case $::osfamily {
    debian: {
      class { "apt::proxy":
	proxy_url => $http_proxy,
      }
    }
  }

  if $http_proxy == 'UNDEFINED' {
    file { "/etc/environment":
      ensure  => file,
      content => '';
    }
  } else {
    file { "/etc/environment":
      ensure  => file,
      content => template('base/environment.erb');
    }
  }
}
