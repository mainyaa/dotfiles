# centos 6

uname -i


yum install -y http://ftp.riken.jp/Linux/fedora/epel/6/i386/epel-release-6-8.noarch.rpm

yum -y install apt
#yum -y install wget vim zsh screen
#yum install -y gcc gcc-c++ make git openssl-devel zlib-devel readline-devel sqlite-devel bzip2-devel
#yum -y groupinstall "Development Tools"
#yum -y install pcre-devel xz-devel
apt-get -y install wget vim zsh screen lv
apt-get install -y build-essential gcc g++ make git openssl zlibc zlib1g zlib1g-dev libreadline6 sqlite bzip2
apt-get install language-pack-ja -y --fix-missing
update-locale LANG=ja_JP.UTF-8
apt-get install -y software-properties-common
apt-get install -y automake pkg-config libpcre3-dev zlib1g-dev liblzma-dev
apt-get install -y silversearcher-ag
apt-get install -y ruby rubygems
apt-get install -y node
apt-get install -y python

# oh-my-zsh
curl -L https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh | sh

# pyenv
cd ~
git clone git://github.com/yyuu/pyenv.git .pyenv

# ag
cd ~/src
git clone https://github.com/ggreer/the_silver_searcher
cd the_silver_searcher
./build.sh
make install

# direnv
cd ~/src
git clone https://github.com/zimbatm/direnv
cd direnv
sudo apt-get install -y golang
gem install bundler
sudo gem install ronn
make install

# chef install 
cd ~
curl -L https://www.opscode.com/chef/install.sh | sudo bash
#curl https://raw.github.com/hnakamur/setup_linux/master/centos6/install_chef-solo.sh | sh

gem install berkshelf

#vagrant
cd ~
#wget https://dl.bintray.com/mitchellh/vagrant/vagrant_1.4.1_x86_64.rpm
#rpm -ivh vagrant_1.4.1_x86_64.rpm
wget https://dl.bintray.com/mitchellh/vagrant/vagrant_1.4.1_x86_64.deb
dpkg -i vagrant_1.4.1_x86_64.deb
vagrant plugin install vagrant-cachier
vagrant plugin install vagrant-berkshelf

# maven
cd ~
wget http://ftp.yz.yamagata-u.ac.jp/pub/network/apache/maven/maven-3/3.1.1/binaries/apache-maven-3.1.1-bin.tar.gz
sudo tar -C /usr/local -xzf apache-maven-3.1.1-bin.tar.gz

export M2_HOME=/usr/local/apache-maven-3.1.1

export PATH=$PATH:/usr/local/go/bin

wget http://peak.telecommunity.com/dist/ez_setup.py
python ez_setup.py

# supervisord
apt-get -y install supervisor



