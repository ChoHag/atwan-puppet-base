# Placeholder for any configuration required before package management or
# puppet are set up.

class base::setup {
  # A resource for the sake of having a resource
  file { "/root":
    ensure => directory,
    owner  => 'root',
    group  => 'root',
    mode   => '0700';
  }
}
