class base::params {
  case $::osfamily {
    debian: {
      $install_packages = [ 'vim-nox', 'less', 'screen' ]
      $remove_packages  = [ ]
    }

    redhat: {
      $install_packages = [ 'vim-minimal', 'less', 'screen' ]
      $remove_packages  = [ ]
    }
  }

  $install_packages_extra = [ ]
  $remove_packages_extra  = [ ]
}
