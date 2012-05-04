class {'tim':
  user {"tim":
    ensure => present,
    shell  => "/bin/bash"
    groups => ["sudo"],
    home => "/home/tim",
    managehome => "true",
  }

  file {"/home/tim/.bash_profile":
    source => "puppet://modules/tim/bash_profile",
    owner => "tim"
    group => "tim"
    mode => "640"
  }

  file {"/home/tim/.bash_rc":
    source => "puppet://modules/tim/bash_rc",
    owner => "tim"
    group => "tim"
    mode => "640"
  }
  Class['base'] -> Class['tim']
}
