node default {
 include base
 include ssh
 include sudo
 include tim
}

node 'riwaka' inherits default {
  #include ruby
  #include rvm
  #include gui
  #include vim
  #include rythmbox
  #include spotify
  #include dropbox
  #include fonts
  #include libreoffice
  #include ack
  #include chromium
  #include mendeley
  #include virtualbox
  #include git
  #include gmpc
  #include wifi
  #include printing
  #include mysql
  #include sqlite
  #pdf reader
  #mail client
  #chat client
  #terminal
}

node 'motueka' inherits default {
 # include base
 # include ssd
 # include ssh
 # include sudo
 # include tim
 # include ruby
 # include rvm
 # include python
 # include haskell
 # include gui
 # include vim
 # include rythmbox
 # include vlc
 # include spotify
 # include dropbox
 # include fonts
 # include java
 # include shotwell
 # include libreoffice
 # include ack
 # include chromium
 # include mendeley
 # include virtualbox
 # include git
 # include gimp
 # include gmpc
 # include wifi
 # include printing
 # include mysql
 # include postgresql
 # include sqlite
 # include redis
 # include skype
 # include transmission
  #pdf reader
  #mail client
  #chat client
  #terminal
}
