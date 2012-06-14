class ssh {
  package {'openssh-server':
    ensure => "installed",
  }

  augeas {'dissalow_root_ssh_login':
    context => "/files/etc/ssh/sshd_conf",
    changes => [
      "set PermitRootLogin no",
    ],
  }

  service {'ssh':
    ensure => running,
    enable => true,
    hasstatus => true,
    hasrestart => true,
  }
  Class['base'] -> Class['ssh']
}

