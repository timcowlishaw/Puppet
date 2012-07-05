class x {
  apt::force {"xorg":
    release => "testing"
  }

  package { "xorg": ensure => "installed" }
}
