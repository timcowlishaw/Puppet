class {'base':
  package {
    "build-essential": ensure => installed;
    "bash-completion": ensure => installed;
    "git-core": ensure => installed;
    "puppet": ensure => installed;
    "wget": ensure => installed;
  }
}
