# このコマンドなんだっけ？ってなったら`brew home <command>`

brew tap homebrew/versions
brew tap homebrew/dupes
brew tap telemachus/homebrew-desc
brew install brew-desc
brew tap phinze/homebrew-cask
brew update

brew upgrade


# GNU tools
brew install binutils
brew install diffutils
brew install ed --default-names
brew install findutils --default-names
brew install gawk
brew install gnu-indent --default-names
brew install gnu-sed --default-names
brew install gnu-tar --default-names
brew install gnu-which --default-names
brew install gnutls --default-names
brew install grep --default-names
brew install gzip
brew install readline
brew install screen
brew install watch
brew install wdiff --with-gettext
brew install wget
brew install xz

# core
brew install coreutils
brew install ctags
brew install erlang
brew install gdb
brew install gdbm
brew install reattach-to-user-namespace
brew install tmux
# programming
brew install llvm
brew install maven
brew install node
#brew install phantomjs
brew install python
#brew install pythonbrew
#brew install spidermonkey
#brew install yuicompressor
brew install ruby
brew install checkbashisms
brew install flow
#brew install ghc # haskell impl
#brew install haskell-platform
brew install cmake
brew install qt
brew install golang
# utils
brew install ag
brew install ack
brew install cmigemo
brew install colordiff
brew install direnv
brew install gibo
brew install git-flow
#brew install gitgs
#brew install grunt
brew install pcre
brew install pidof
brew install spark
brew install trash
brew install tree
# multimedia
brew install optipng
brew install imagemagick
brew install graphviz
brew install ffmpeg
# network
brew install wireshark --with-x
brew install mitmproxy
# filesystem
#brew install ibevent
brew install libtool
brew install nspr
brew install oniguruma
brew install pkg-config
brew install protobuf
brew install pssh
brew install pstree
brew install sbt
brew install scala
#brew install serf
brew install socat
brew install sqlite
brew install tig
brew install z
brew install zsh-completions

brew install brew-cask
brew cask install virtualbox
brew cask install vagrant
brew install docker
brew install boot2docker
# install qemu
# install dvdrtools
# install groff

# install mac binary
brew cask install audacity
brew cask install gimp
brew cask install google-chrome
brew cask install google-drive
brew cask install google-hangouts
brew cask install google-japanese-ime
brew cask install inkscape
brew cask install libreoffice
brew cask install LightPaper
brew cask install limechat
brew cask install mi
brew cask install kindle
brew cask install skype
# utils
brew cask install android-file-transfer
brew cask install bettertouchtool
brew cask install keyfinder
brew cask install Karabiner
brew cask install scroll-reverser
# network
# programming
brew cask install android-studio
brew cask install eclipse-ide
brew cask install genymotion
brew cask install github
brew cask install gitx-l
#cask install google-app-engine-launcher
brew cask install growlnotify
brew cask install gyazo
brew cask install heroku-toolbelt
brew cask install intellij-idea-ce
brew cask install iterm2
brew cask install java
brew cask install jd-gui
brew cask install jq
brew cask install mucommander
brew cask install mono-mre
brew cask install mou
brew cask install macs-fan-control
brew cask install p4merge
brew cask install porthole
brew cask install sauce
brew cask install synergy
brew cask install xquartz

# taps

brew tap lestrrat/peco
brew install peco

brew clean

