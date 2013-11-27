mkdir -p ~/src
git clone git@github.com:mainyaa/dotfiles.git ~/src/dotfiles
cd ~/src/dotfiles

[ -f ~/.zshrc ] && mv ~/.zshrc ~/.zshrc.old
[ -f ~/.bashrc ] && mv ~/.bashrc ~/.bashrc.old
[ -f ~/.bash_profile ] && mv ~/.bash_profile ~/.bash_profile.old
[ -f ~/.vim ] && mv ~/.vim ~/.vim.old
[ -f ~/.vimrc ] && mv ~/.vimrc ~/.vimrc.old

ln -s ~/src/dotfiles/.zshrc ~/
ln -s ~/src/dotfiles/.bashrc ~/
ln -s ~/src/dotfiles/.bash_profile ~/
ln -s ~/src/dotfiles/.bash_env ~/
ln -s ~/src/dotfiles/.bash_mac ~/
ln -s ~/src/dotfiles/.bash_linux ~/
ln -s ~/src/dotfiles/.editorconfig ~/
ln -s ~/src/dotfiles/.gemrc ~/
ln -s ~/src/dotfiles/.gitconfig ~/
ln -s ~/src/dotfiles/.gitconfig_mac ~/
ln -s ~/src/dotfiles/.tmux.conf ~/
ln -s ~/src/dotfiles/.gitignore_global ~/.gitignore_global
ln -s ~/src/dotfiles/irbrc ~/.irbrc
ln -s ~/src/dotfiles/pryrc ~/.pryrc

mkdir -p ~/_vim/autoload
mkdir -p ~/_vim/bundle
git clone https://github.com/gmarik/vundle.git ~/_vim/vundle.git

ln -s ~/src/dotfiles/vimfiles/_vim ~/_vim
ln -s ~/src/dotfiles/vimfiles/_gvimrc ~/_gvimrc
ln -s ~/src/dotfiles/vimfiles/_vimrc ~/_vimrc

mkdir -p ~/_vim/dict
wget https://raw.github.com/Cside/dotfiles/master/.vim/dict/perl.dict
mv perl.dict ~/_vim/dict/
wget https://github.com/cooldaemon/myhome/blob/master/.vim/dict/javascript.dict
mv javascript.dict ~/_vim/dict/

vim +BundleInstall +qall
sudo npm install -g grunt-cli
sudo npm install -g coffee
sudo npm install -g js2coffee
sudo npm install -g typescript
sudo npm install -g tslint
sudo npm install -g jslint
sudo npm install -g jshint
sudo npm install -g jstags

mkdir -p ~/bin
curl https://raw.github.com/git/git/master/contrib/diff-highlight/diff-highlight > ~/bin/diff-highlight
chmod +x ~/bin/diff-highlight

