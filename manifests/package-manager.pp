class base::package-manager {
  $apt_sources = $base::setup::apt_sources
  $yum_sources = $base::setup::yum_sources

  case $::osfamily {
    debian: {
      class { 'apt::source::collection':
	collection => $apt_sources;
      }

      -> class { 'apt::update': }
    }

    redhat: {
    }
  }
}
