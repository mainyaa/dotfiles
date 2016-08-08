
# brew
brew update
brew upgrade
brew cleanup
brew cask cleanup

# npm
nodebrew selfupdate
nodebrew install io@latest
nodebrew use io@latest
npm update -g

# python
pip install --upgrade pip
pip-review --auto

# ruby
gem update

# vim
vim +PluginUpdate +qall

