class virtualbox {
  apt::source {'virtualbox':
    location => "http://download.virtualbox.org/virtualbox/debian",
    release => "wheezy",
    repos => "contrib non-free",
    include_src => false
  }

  exec {'virtualbox-key':
    command => "/usr/bin/wget -q http://download.virtualbox.org/virtualbox/debian/oracle_vbox.asc -O- | /usr/bin/apt-key add -",
    unless => "/usr/bin/apt-key list | /bin/grep VirtualBox",
    user => root,
  }

  package {'virtualbox-4.2':
    ensure => "installed",
    require => [Apt::Source['virtualbox'], Exec['virtualbox-key']]
  }
}
