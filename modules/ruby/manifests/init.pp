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
  package {'ruby1.9.1':
    ensure => "installed",
  }
  package {'ruby1.9.1-dev':
    ensure => "installed",
  }
  exec {"/usr/bin/update-alternatives --set ruby /usr/bin/ruby1.8":
    require  => Package['ruby1.8', 'ruby1.9.1', 'ruby1.8-dev', 'ruby1.9.1-dev', 'rubygems1.8'],
  }
  exec {"/usr/bin/update-alternatives --set gem /usr/bin/gem1.8":
    require  => Package['ruby1.8', 'ruby1.9.1', 'ruby1.8-dev', 'ruby1.9.1-dev', 'rubygems1.8'],
  }
  Class['base'] -> Class['ruby']
}
