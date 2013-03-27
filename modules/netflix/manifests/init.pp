class netflix {
  apt::source {'netflix':
    location => "http://ppa.launchpad.net/ehoover/compholio/ubuntu",
    release => "oneiric",
    repos => "main",
    key => "1F691896",
    key_server => "keyserver.ubuntu.com",
  }

  package {"netflix-desktop":
    ensure => "installed",
    require => Apt::Source["netflix"]
  }

  Class["x"] -> Class["netflix"]
}
