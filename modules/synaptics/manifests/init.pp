class synaptics {
  package {"xserver-xorg-input-synaptics": ensure => "installed"}
  file {"/etc/X11/xorg.conf.d":
    ensure => "directory"
  }

  file {"/etc/X11/xorg.conf.d/99-synaptics.conf":
    ensure => "present",
    source => "puppet:///modules/synaptics/99-synaptics.conf",
    require => File["/etc/X11/xorg.conf.d"]
  }
  Class["x"] -> Class["synaptics"]
}
