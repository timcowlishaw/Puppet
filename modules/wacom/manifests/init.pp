class wacom {
  package {"xserver-xorg-input-wacom": ensure => "installed"}

  file {"/etc/X11/xorg.conf.d/99-wacom.conf":
    ensure => "present",
    source => "puppet:///modules/wacom/99-wacom.conf",
  }

  Class['x'] -> Class['wacom']
}
