# ubuntu

set -ux

uname -i

apt install -y wget vim zsh screen lv
apt install -y build-essential gcc g++ make git openssl zlibc zlib1g zlib1g-dev libreadline6 sqlite zip bzip2
apt install -y language-pack-ja --fix-missing
update-locale LANG=ja_JP.UTF-8
apt install -y software-properties-common
#apt install -y automake pkg-config libpcre3-dev zlib1g-dev liblzma-dev
#apt install -y ruby rubygems
#apt install -y node
apt install -y python python-pip
apt install -y silversearcher-ag
apt install -y direnv



# npm
#eval install_npm.sh
# python
#eval install_python.sh
# ruby
#eval install_ruby.sh



