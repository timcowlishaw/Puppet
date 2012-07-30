class ssd(
  $device = undef
) {

  mount { "/tmp":
    device => "tmpfs",
    dump => "0",
    ensure => "present",
    fstype => "tmpfs",
    pass => "0",
    options => "nodev,nosuid,mode=1777"
  }

  mount { "/var/tmp":
    device => "tmpfs",
    dump => "0",
    ensure => "present",
    fstype => "tmpfs",
    pass => "0",
    options => "nodev,nosuid,mode=1777"
  }

  augeas { "ssd-noatime":
    context => "/files/etc/fstab/*[spec='UUID=${device}' and ./opt/* !='noatime']",
    changes => [
      "ins opt after opt[last()]",
      "set opt[last()] noatime"
    ]
  }

  augeas { "ssd-trim":
    context => "/files/etc/fstab/*[spec='UUID=${device}' and ./opt/* !='discard']",
    changes => [
      "ins opt after opt[last()]",
      "set opt[last()] discard"
    ]
  }

  $scheduler_line = "ENV{ID_FS_UUID}==\\\"${device}\\\", ATTR{../queue/scheduler}=\\\"noop\\\""

  exec { "ssd-scheduler":
    command => "/bin/echo \"${scheduler_line}\" >> /etc/udev/rules.d/99-ssd-scheduler.rules",
    unless => "/bin/grep \"${scheduler_line}\" /etc/udev/rules.d/99-ssd-scheduler.rules"
  }

}
