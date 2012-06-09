class apt-defaults {
  class { 'apt':
    always_apt_update => true,
    purge_sources_list => true,
    purge_sources_list_d => true,
    purge_preferences_d => true
  }

  class {'apt::release':
    release_id => 'stable'
  }
  apt::pin {'stable-updates': release => 'stable/updates', priority => 1000 }
  apt::pin {'testing-updates': release => 'testing/updates', priority => 1000 }
  apt::pin {'stable' : priority => 995 }
  apt::pin {'testing': priority => 750 }
  apt::pin {'unstable': priority => 50 }
  apt::pin {'experimental': priority => 1}

  apt::source {'stable-updates':
    location => "http://security.debian.org",
    release => "stable/updates",
    repos => "main contrib non-free",
    pin => 1000
  }

  apt::source {'testing-updates':
    location => "http://security.debian.org",
    release => "testing/updates",
    repos => "main contrib non-free",
    pin => 1000
  }

  apt::source {'stable':
    location => "http://ftp.uk.debian.org/debian",
    release => "stable",
    repos => "main contrib non-free",
    pin => 995,
    include_src => true
  }

  apt::source {'testing':
    location => "http://ftp.uk.debian.org/debian",
    release => "testing",
    repos => "main contrib non-free",
    pin => 750,
    include_src => true
  }

  apt::source {'unstable':
    location => "http://ftp.uk.debian.org/debian",
    release => "unstable",
    repos => "main contrib non-free",
    pin => 50,
    include_src => true
  }

  apt::source {'experimental':
    location => "http://ftp.uk.debian.org/debian",
    release => "unstable",
    repos => "main contrib non-free",
    pin => 1,
    include_src => true
  }

}
