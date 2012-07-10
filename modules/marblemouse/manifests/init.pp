class marblemouse {
  file { "/usr/share/X11/xorg.conf.d/50-marblemouse.conf":
    ensure => "present",
    source => "puppet:///modules/marblemouse/50-marblemouse.conf",
    owner => "root",
    group => "root",
    mode => "644",
  }
  Class['base'] -> Class['marblemouse']
  Class['x'] -> Class['marblemouse']
}
