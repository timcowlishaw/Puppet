class x {
  package {"xorg":
    ensure => "installed",
  }

  package {"xserver-common":
    ensure => "installed",
  }
  
  package {"xserver-xorg":
    ensure => "installed",
  }

  package {"ncurses-term":
    ensure => "installed",
  }
  
  package {"rxvt-unicode-256color":
    ensure => "installed",
  }

  package { "xmonad":
    ensure => "installed",
  }

  package { "xmobar":
    ensure => "installed",
  }

  package { "trayer":
    ensure => "installed",
 }
  
  package { "parcellite":
    ensure => "installed",
  }

  package { "dmenu":
    ensure => "installed",
  }

  package { "slim":
    ensure => "installed",
  }
  
  package { "xscreensaver":
    ensure => "installed",
  }
  
  package { "pcmanfm":
    ensure => "installed",
  }
  
  package { "lxappearance":
    ensure => "installed",
  }
  
  package { "chromium-browser":
    ensure => "installed",
  }
}
