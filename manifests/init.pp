class base(
  $install_packages       = $base::params::install_packages,
  $remove_packages        = $base::params::remove_packages,
  $install_packages_extra = $base::params::install_packages_extra,
  $remove_packages_extra  = $base::params::remove_packages_extra
) inherits base::params {
  package {
    $install_packages:
      ensure => installed;

    $install_packages_extra:
      ensure => installed;

    $remove_packages:
      ensure => purged;

    $remove_packages_extra:
      ensure => purged;
  }

  class { "puppet": }
}
