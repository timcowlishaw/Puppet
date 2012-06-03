class base {
  package { "build-essential": ensure => "installed" }
  package { "bash-completion": ensure => "installed" }
  package { "git-core": ensure => "installed" }
  package { "puppet": ensure => "installed" }
  package { "wget": ensure => "installed" }
}

