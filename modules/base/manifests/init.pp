class base {

  include apt-defaults

  apt::force {"puppet":
    release => "testing"
  }

  package { "build-essential": ensure => "installed" }
  package { "bash-completion": ensure => "installed" }
  package { "git-core": ensure => "installed" }
  #package { "puppet": ensure => "installed" }
  package { "curl": ensure => "installed" }
  package { "wget": ensure => "installed" }
  package { "vim-nox": ensure => "installed" }
  package { "exuberant-ctags": ensure => "installed" }
  package { "augeas-tools": ensure => "installed"}
  package { "zip": ensure => "installed"}
  package { "unzip": ensure => "installed"}
  package { "ack-grep": ensure => "installed"}
  package { "mosh": ensure => "installed"}
  package { "tmux": ensure => "installed"}
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

  file { "/etc/rc.local.d":
    ensure => "directory",
    owner => "root",
    group => "root",
    mode => "755",
  }
  file { "/etc/rc.local":
    ensure => "present",
    source => "puppet:///modules/base/rc.local",
    owner => "root",
    group => "root",
    mode => "755",
  }
}

