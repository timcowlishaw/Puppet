class shotwell {
  package {"shotwell": ensure => "installed"}
  Class['x'] -> Class['shotwell']
}
