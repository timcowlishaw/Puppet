node default {
 include base
 include ssh
 include sudo
 include ruby
 include tim
}


node 'cascade' inherits default {
  include x
  include comms
  include audio
  include spotify
  include mysql
  include rvm
  include marblemouse
  include virtualbox
}

node 'motueka' inherits default {
  include comms
  include rvm
  include x
  include audio
  include spotify
  include mysql
  include thinkpad-wifi
  include thinkpad-power
  include disable-bell
  include python-dev
 # include ssd
 # include haskell
 # include rythmbox
 # include vlc
 # include dropbox
 # include java
 # include shotwell
 # include libreoffice
 # include mendeley
 # include virtualbox
 # include gimp
 # include gmpc
 # include wifi
 # include printing
 # include postgresql
 # include sqlite
 # include redis
 # include skype
 # include transmission
  #pdf reader
}
