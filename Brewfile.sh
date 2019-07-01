# このコマンドなんだっけ？ってなったら`brew home <command>` --force

brew tap homebrew/versions --force
brew tap homebrew/dupes --force
brew tap telemachus/homebrew-desc --force
brew install brew-desc --force
brew tap phinze/homebrew-cask --force
brew tap caskroom/fonts --force
brew update --force

brew upgrade --force


# GNU tools --force
brew install binutils  --force --force
brew install diffutils --force
brew install ed --default-names --force
brew install findutils --default-names --force
brew install gawk --force
brew install gnu-indent --default-names --force
brew install gnu-sed --force
brew install gnu-tar --default-names --force
brew install gnu-which --default-names --force
brew install gnutls --default-names --force
brew install grep --default-names --force
brew install gzip --force
brew install readline --force
brew install screen --force
brew install watch --force
brew install wdiff --with-gettext --force
brew install wget --force
brew install xz --force

# newer
brew install bash --force
brew install emacs --force
brew install gdb  # gdb requires further actions to make it work. See `brew info gdb`. --force
brew install gpatch --force
brew install m4 --force
brew install make --force
brew install nano --force
brew install zsh --force
brew install zsh-syntax-highlighting --force
brew install zsh-history-substring-search --force

# core --force
brew install coreutils --force
brew install ctags --force
brew install erlang --force
brew install gdb --force
brew install gdbm --force
brew install reattach-to-user-namespace --force
brew install tmux --force

# programming
brew install llvm --force
brew install maven --force
brew install node --force
#brew install phantomjs --force
brew install python --force
#brew install pythonbrew --force
#brew install spidermonkey --force
#brew install yuicompressor --force
brew install ruby --force
brew install checkbashisms --force
brew install flow --force
#brew install ghc # haskell impl --force
#brew install haskell-platform --force
brew install cmake --force
brew install qt --force
brew install golang --force

# vcs
brew install svn --force
brew install hg --force

# utils
brew install ag --force
brew install ack --force
brew install cmigemo --force
brew install colordiff --force
brew install direnv --force
brew install gibo --force
brew install git --force
brew install git-flow --force
#brew install gitgs --force
#brew install grunt --force
brew install pcre --force
brew install pidof --force
brew install spark --force
brew install trash --force
brew install tree --force
# multimedia --force
brew install optipng --force
brew install imagemagick --force
brew install graphviz --force
brew install ffmpeg \
  --with-fdk-aac --with-libvo-aacenc \
  --with-libvorbis --with-libvpx \
  --with-openjpeg --with-theora \
  --with-opencore-amr \
  --with-libfreetype \
  --force
# network
brew install wireshark --with-x --force
brew install mitmproxy --force
# filesystem
#brew install ibevent --force
brew install libtool --force
brew install nspr --force
brew install oniguruma --force
brew install pkg-config --force
brew install protobuf --force
brew install pssh --force
brew install pstree --force
brew install sbt --force
brew install scala --force
#brew install serf --force
brew install socat --force
brew install sqlite --force
brew install tig --force
brew install z --force
brew install zsh-completions --force

brew install brew-cask --force
brew cask install virtualbox --force
brew cask install vagrant --force
brew install docker --force
brew cask install docker --force
# install qemu --force
# install dvdrtools --force
# install groff --force

# install mac binary
brew cask install audacity --force
brew cask install gimp --force
brew cask install google-chrome --force
brew cask install google-drive --force
brew cask install google-hangouts --force
brew cask install google-japanese-ime --force
brew cask install inkscape --force
brew cask install libreoffice --force
brew cask install LightPaper --force
brew cask install limechat --force
brew cask install mi --force
brew cask install kindle --force
brew cask install skype --force

# utils
brew cask install android-file-transfer --force
brew cask install bettertouchtool --force
brew cask install keyfinder --force
brew cask install Karabiner --force
brew cask install scroll-reverser --force

# network
# programming
brew cask install android-studio --force
brew cask install eclipse-ide --force
brew cask install genymotion --force
brew cask install github --force
brew cask install gitx-l --force
#cask install google-app-engine-launcher --force
brew cask install growlnotify --force
brew cask install gyazo --force
brew cask install heroku-toolbelt --force
brew cask install intellij-idea-ce --force
brew cask install iterm2 --force
brew cask install java --force
brew cask install jd-gui --force
brew cask install jq --force
brew cask install mucommander --force
brew cask install mono-mre --force
brew cask install mou --force
brew cask install macs-fan-control --force
brew cask install p4merge --force
brew cask install porthole --force
brew cask install sauce --force
brew cask install synergy --force
brew cask install xquartz --force
brew cask install sourcetree --force
brew cask install sketch --force
brew cask install slack --force
brew cask install visual-studio-code --force
brew cask install atom --force

# sshfs
brew cask install osxfuse --force
brew install sshfs --force

# font
brew cask install font-source-code-pro --force
brew cask install font-roboto --force
brew cask install font-noto-sans --force

# taps --force

brew tap lestrrat/peco --force
brew install peco --force

brew clean --force

sudo ln -s /usr/local/share/git-core/contrib/diff-highlight/diff-highlight /usr/local/bin/diff-highlight
