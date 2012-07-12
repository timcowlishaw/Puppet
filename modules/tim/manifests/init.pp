class tim {
  user {"tim":
    ensure => present,
    shell  => "/bin/bash",
    groups => ["sudo","cdrom","floppy","audio","dip","video","plugdev"], #"dropbox"
    home => "/home/tim",
    managehome => "true",
  }

  if $hostname == "motueka" {
    $prompt_colour_1 = 'R'
    $prompt_colour_2 = 'C'
  } elsif $hostname == "riwaka" {
    $prompt_colour_1 = 'R'
    $prompt_colour_2 = 'M'
  } elsif $hostname == "kohatu" {
    $prompt_colour_1 = 'B'
    $prompt_colour_2 = 'C'
  } elsif $hostname == "cascade" {
    $prompt_colour_1 = 'EMR'
    $prompt_colour_2 = 'Y'
  } else {
    $prompt_colour_1 = 'W'
    $prompt_colour_2 = 'W'
  }

  file {"/home/tim/.host_prompt_colours":
    content => template("tim/host_prompt_colours.erb"),
    owner => "tim",
    group => "tim",
    mode => "640",
  }

  exec {"clone_dotfiles_repo":
    command => "/usr/bin/git clone git@github.com:timcowlishaw/dotfiles.git /home/tim/.dotfiles",
    creates => "/home/tim/.dotfiles",
    user => "tim",
    group => "tim",
  }

  exec {"setup_dotfile_symlinks":
    command => "/home/tim/.dotfiles/bin/install.rb",
    user => "tim",
    group => "tim",
    environment => "HOME=/home/tim",
    require => Exec["clone_dotfiles_repo"],
  }

  Class['ruby'] -> Class['tim']
  Class['base'] -> Class['tim']
}
