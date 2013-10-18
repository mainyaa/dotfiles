mkdir -p ~/src
git clone git@github.com:mainyaa/dotfiles.git ~/src/dotfiles
cd ~/src/dotfiles

mkdir -p ~/_vim/autoload
mkdir -p ~/_vim/bundle
git clone http://github.com/gmarik/vundle.git ~/_vim/vundle.git

ln -s ~/src/dotfiles/vimfiles/_vim ~/_vim
ln -s ~/src/dotfiles/vimfiles/_gvimrc ~/_vimrc
ln -s ~/src/dotfiles/vimfiles/_vimrc ~/_vimrc

mkdir -p ~/_vim/dict
wget https://raw.github.com/Cside/dotfiles/master/.vim/dict/perl.dict
mv perl.dict ~/_vim/dict/
wget https://github.com/cooldaemon/myhome/blob/master/.vim/dict/javascript.dict
mv javascript.dict ~/_vim/dict/

ln -s ~/src/dotfiles/.bashrc ~/
ln -s ~/src/dotfiles/.bash_profile ~/
ln -s ~/src/dotfiles/.editorconfig ~/
ln -s ~/src/dotfiles/.gemrc ~/
ln -s ~/src/dotfiles/.gitconfig ~/
ln -s ~/src/dotfiles/.gitconfig_global ~/
ln -s ~/src/dotfiles/.tmux.conf ~/
ln -s ~/src/dotfiles/gitignore ~/.gitignore
ln -s ~/src/dotfiles/irbrc ~/.irbrc
ln -s ~/src/dotfiles/pryrc ~/.pryrc

vim +BundleInstall +qall
npm install -g coffee
npm install -g js2coffee
npm install -g typescript
npm install -g tslint
npm install -g grunt
npm install -g jslint
npm install -g jshint
npm install -g jstags
