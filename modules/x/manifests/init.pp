class x {
  apt::force {"xorg":
    release => "testing"
  }

  package { "xorg": ensure => "installed" }
  package { "xmonad": ensure => "installed" }
  package { "trayer": ensure => "installed" }
  package { "urxvt": ensure => "installed" }
  package { "parcellite": ensure => "installed" }
  package { "dmenu": ensure => "installed"}
}
