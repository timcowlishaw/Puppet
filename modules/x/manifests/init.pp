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

  package { "exo-utils":
    ensure => "installed",
  }

  package { "slim":
    ensure => "installed",
  }

  package { "xscreensaver":
    ensure => "installed",
  }

  package { "xclip":
    ensure => "installed",
  }

  package { "pcmanfm":
    ensure => "installed",
  }

  package { "lxappearance":
    ensure => "installed",
  }

  package { "ttf-mscorefonts-installer":
    ensure => "installed",
  }

  package { "chromium-browser":
    ensure => "installed",
  }

  package { "flashplugin-nonfree":
    ensure => "installed",
    require => Package["chromium-browser"]
  }

  package { "vim-gtk":
    ensure => "installed",
    require => Package["vim-nox"]
  }

  package { "evince":
    ensure => "installed",
  }

  package { "vlc":
    ensure => "installed",
  }

  package { "gparted":
    ensure => "installed",
  }

  package { "libreoffice": ensure => "installed"}

  package { "libreoffice-l10n-en-gb": ensure => "installed"}

  package { "gqview": ensure => "installed"}

  package { "transmission": ensure => "installed"}

  package { "iceweasel": ensure => "installed"}

  class { 'dropbox':
    user     => 'tim',
  }

  file {"/etc/X11/xorg.conf.d":
    ensure => "directory"
  }

  file { "/etc/X11/Xsession.d/20x11-host-specific":
    ensure => "present",
    source => [
   	"puppet:///modules/x/host-specific-xsession-${hostname}",
	"puppet:///modules/x/host-specific-xsession-default",
    ],
    owner => "root",
    group => "root",
    mode => "644",
  }

  Class['base'] -> Class['x']
}


