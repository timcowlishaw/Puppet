class base {

  include apt-defaults

  apt::force {"puppet":
    release: "testing"
  }

  package { "build-essential": ensure => "installed" }
  package { "bash-completion": ensure => "installed" }
  package { "git-core": ensure => "installed" }
  package { "puppet": ensure => "installed" }
  package { "wget": ensure => "installed" }
  package { "augeas-tools": ensure => "installed"}
  package { "hiera":
    provider => "gem",
    ensure => "installed"
  }
  package { "hiera-puppet":
    provider => "gem",
    ensure => "installed"
  }
  package { "hiera-gpg":
    provider => "gem",
    ensure => "installed"
  }
}

