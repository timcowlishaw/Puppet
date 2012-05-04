class {'sudo':
  package {'sudo':
    ensure => installed,
  }

  augeas {'disallow_su_to_root':
    context => "/files/etc/pam.d/su"
    changes => [
      "ins 10000000 before *",
      "set 10000000/type auth",
      "set 10000000/control required",
      "set 10000000/module pam_wheel.so"
    ],
    onlyif => "match *[type='auth'][control='required'][module='pam_wheel.so'] size==0",
  }

  exec {'passwd -d root': }
  exec {'passwd -l root': }
}

