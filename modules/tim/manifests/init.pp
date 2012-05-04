class tim {
  user {"tim":
    ensure => present,
    shell  => "/bin/bash",
    groups => ["sudo","cdrom","floppy","audio","dip","video","plugdev"],
    home => "/home/tim",
    managehome => "true",
  }

  file {"/home/tim/.bash_profile":
    source => "/etc/puppet/modules/tim/files/bash_profile",
    owner => "tim",
    group => "tim",
    mode => "640",
  }

  file {"/home/tim/.bashrc":
    source => "/etc/puppet/modules/tim/files/bashrc",
    owner => "tim",
    group => "tim",
    mode => "640",
  }
  Class['base'] -> Class['tim']
}
