class ruby {
  package {'ruby1.8-dev':
    ensure => "installed",
  }
  package {'rubygems1.8':
    ensure => "installed",
  }
  package {'ruby1.8':
    ensure => "installed",
  }
  Class['base'] -> Class['ruby']
}
