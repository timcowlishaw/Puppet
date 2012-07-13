class disable-bell {
  kmod::blacklist {"pcspkr": ensure => "present" }
  Class['base'] -> Class['disable-bell']
}
