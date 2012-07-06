class x {
  apt::force {"xorg":
    release => "testing",
  }

  apt::force {"ncurses-term":
    release => "testing",
  }

  apt::force {"rxvt-unicode-256color":
    release => "testing",
    require => Apt::Force["xorg", "ncurses-term"],
  }

  package { "xmonad":
    ensure => "installed",
    require => Apt::Force["xorg"],
  }
 
  package { "trayer":
    ensure => "installed",
    require => Apt::Force["xorg"],
 }
  
  package { "parcellite":
    ensure => "installed",
    require => Apt::Force["xorg"],
  }

  package { "dmenu":
    ensure => "installed",
    require => Apt::Force["xorg"],
  }

  package { "slim":
    ensure => "installed",
    require => Apt::Force["xorg"],
  }
  
  package { "xscreensaver":
    ensure => "installed",
    require => Apt::Force["xorg"],
  }
}
