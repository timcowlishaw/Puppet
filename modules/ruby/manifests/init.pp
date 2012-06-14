class ruby {
  package {'ruby-dev':
    ensure => "installed",
  }
  package {'rubygems':
    ensure => "installed",
  }
  package {'ruby':
    ensure => "installed",
  }
  Class['base'] -> Class['ruby']
}
