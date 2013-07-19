# Class to configure package management and other services required extremely
# early in the initialisation phase.
class base::setup(
  $http_proxy  = params_lookup('http_proxy',  'global'),
  $apt_sources = params_lookup('apt_sources', 'global'),
  $yum_sources = params_lookup('yum_sources', 'global'),
) inherits base::params {
  # HTTP proxy and package repositories are not managed by puppet while
  # bootstrapping the puppetmaster.
  if $::bootstrap_puppetmaster { } else {
    class { 'base::proxy': }

    -> class { 'base::package-manager': }
  }
}
