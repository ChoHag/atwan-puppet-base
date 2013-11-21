class base(
  $install_packages       = params_lookup('install_packages',       'global'),
  $remove_packages        = params_lookup('remove_packages',        'global'),
  $install_packages_extra = params_lookup('install_packages_extra', 'global'),
  $remove_packages_extra  = params_lookup('remove_packages_extra',  'global'),
  $with_puppet            = params_lookup('with_puppet',            'global'),
) inherits base::params {
  if $install_packages != 'UNDEFINED' {
    package { $base::install_packages:
      ensure => installed;
    }
  }

  if $base::install_packages_extra != 'UNDEFINED' {
    package { $base::install_packages_extra:
      ensure => installed;
    }
  }

  if $base::remove_packages != 'UNDEFINED' {
    package { $base::remove_packages:
      ensure => purged;
    }
  }

  if $base::remove_packages_extra != 'UNDEFINED' {
    package { $base::remove_packages_extra:
      ensure => purged;
    }
  }

  if $with_puppet {
    class { "puppet": }
  }
}
