class {'ssh':
  package {'task-ssh-server'
    ensure => installed,
  }

  augeas {'dissalow_root_ssh_login':
    context => "/files/etc/ssh/sshd_conf",
    changes => [
      "set PermitRootLogin no",
    ],
  }

  service {'sshd':
    ensure => running,
    enable => true,
    hasstatus => true,
    hasrestart => true,
  }
}

