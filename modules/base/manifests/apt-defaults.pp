class apt-defaults {
  file {"/etc/apt/preferences.d/default":
    content => "puppet:///modules/base/apt-preferences-default",
    owner => "root",
    group => "root",
    mode => "644"
  }

  file {"/etc/apt/sources.list.d/sid":
    content => "puppet:///modules/base/apt-sources-sid",
    owner => "root",
    group => "root",
    mode => "644"
  }

  exec {"apt-update":
    command => "/usr/bin/apt-get update"
  }
}
