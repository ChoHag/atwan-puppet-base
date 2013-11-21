class base::params {
  case $::osfamily {
    debian: {
      $install_packages = [ 'vim-nox', 'less', 'screen' ]
      $remove_packages  = 'UNDEFINED'
    }

    redhat: {
      $install_packages = [ 'vim-minimal', 'less', 'screen' ]
      $remove_packages  = 'UNDEFINED'
    }
  }

  $install_packages_extra = 'UNDEFINED'
  $remove_packages_extra  = 'UNDEFINED'

  $apt_sources = 'UNDEFINED'
  $yum_sources = 'UNDEFINED'

  $http_proxy  = 'UNDEFINED'

  $with_puppet = true
}
