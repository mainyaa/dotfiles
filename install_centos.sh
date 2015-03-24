# centos 6

curl -fsSkL -o /etc/yum.repos.d/hop5.repo http://www.hop5.in/yum/el6/hop5.repo
yum groupinstall -y 'Development Tools'

uname -i


yum install -y http://ftp.riken.jp/Linux/fedora/epel/6/i386/epel-release-6-8.noarch.rpm

yum -y install apt
#yum -y install wget vim zsh screen
#yum install -y gcc gcc-c++ make git openssl-devel zlib-devel readline-devel sqlite-devel bzip2-devel
#yum -y groupinstall "Development Tools"
#yum -y install pcre-devel xz-devel
#yum -y install pkgconfig glib2-devel gettext libxml2-devel pango-devel cairo-devel git ipa-gothic-fonts
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

# ag
cd ~/src
git clone https://github.com/ggreer/the_silver_searcher
cd the_silver_searcher
./build.sh
make install

# direnv
curl https://github.com/zimbatm/direnv/releases/download/v2.5.0/direnv.linux-amd64 > direnv
sudo chmod +x direnv
sudo chown root:staff direnv
sudo mv direnv /usr/local/bin

# peco
curl http://stedolan.github.io/jq/download/linux64/jq > jq
sudo chmod +x jq
sudo chown root:staff jq
sudo mv jq /usr/local/bin

# peco
curl https://github.com/peco/peco/releases/download/v0.3.2/peco_linux_amd64.tar.gz > peco
sudo chmod +x peco
sudo chown root:staff peco
sudo mv peco /usr/local/bin

# chef install 
cd ~
curl -L https://www.opscode.com/chef/install.sh | sudo bash
#curl https://raw.github.com/hnakamur/setup_linux/master/centos6/install_chef-solo.sh | sh
gem install knife-solo
gem install berkshelf

#vagrant
cd ~
#wget https://dl.bintray.com/mitchellh/vagrant/vagrant_1.4.1_x86_64.rpm
#rpm -ivh vagrant_1.4.1_x86_64.rpm
wget https://dl.bintray.com/mitchellh/vagrant/vagrant_1.4.1_x86_64.deb
dpkg -i vagrant_1.4.1_x86_64.deb
vagrant plugin install vagrant-cachier
vagrant plugin install vagrant-berkshelf
vagrant plugin install vagrant-vbguest
vagrant plugin install vagrant-reload

# maven
cd ~
wget http://ftp.yz.yamagata-u.ac.jp/pub/network/apache/maven/maven-3/3.1.1/binaries/apache-maven-3.1.1-bin.tar.gz
sudo tar -C /usr/local -xzf apache-maven-3.1.1-bin.tar.gz

export M2_HOME=/usr/local/apache-maven-3.1.1

export PATH=$PATH:/usr/local/go/bin

# supervisord
#apt-get -y install supervisor

# peco
cd
mkdir -p local/src
cd local/src
wget https://github.com/peco/peco/releases/download/v0.1.12/peco_linux_amd64.tar.gz
tar -C /home/*****/local -xzf peco_linux_amd64.tar.gz
curl https://github.com/peco/peco/releases/download/v0.3.2/peco_linux_386.tar.gz > sudo /usr/local/bin

# npm
eval install_npm.sh
# python
eval install_python.sh
# ruby
eval install_ruby.sh



