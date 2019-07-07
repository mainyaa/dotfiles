# centos 6

set -ux

curl -fsSkL -o /etc/yum.repos.d/hop5.repo http://www.hop5.in/yum/el6/hop5.repo
yum groupinstall -y 'Development Tools'

uname -i


yum install -y http://ftp.riken.jp/Linux/fedora/epel/6/i386/epel-release-6-8.noarch.rpm

yum install -y apt
#yum install -y wget vim zsh screen
#yum install -y gcc gcc-c++ make git openssl-devel zlib-devel readline-devel sqlite-devel bzip2-devel
#yum groupinstall -y "Development Tools"
#yum install -y pcre-devel xz-devel
#yum install -y pkgconfig glib2-devel gettext libxml2-devel pango-devel cairo-devel git ipa-gothic-fonts

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
eval install_npm.sh
# python
eval install_python.sh
# ruby
eval install_ruby.sh



