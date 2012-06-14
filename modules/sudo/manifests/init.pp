class sudo {
  package {'sudo':
    ensure => installed,
  }

  augeas {'disallow_su_to_root':
    context => "/files/etc/pam.d/su",
    changes => [
      "ins 10000 after *[last()]",
      "set 10000/type auth",
      "set 10000/control required",
      "set 10000/module pam_wheel.so"
    ],
    onlyif => "match *[type='auth'][control='required'][module='pam_wheel.so'] size==0",
  }

  exec {'/usr/bin/passwd -d root': }
  exec {'/usr/bin/passwd -l root': }

  Class['base'] -> Class['sudo']
}

