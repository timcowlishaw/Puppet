class x {
  apt::force {"xorg":
    release => "testing"
  }

  apt::force {"rxvt-unicode-256color":
    release => "testing"
  }

  package { "xorg": ensure => "installed" }
  package { "xmonad": ensure => "installed" }
  package { "trayer": ensure => "installed" }
  package { "rxvt-unicode-256color": ensure => "installed" }
  package { "parcellite": ensure => "installed" }
  package { "dmenu": ensure => "installed"}
  package { "slim": ensure => "installed"}
}
