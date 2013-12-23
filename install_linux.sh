# centos 6

uname -i

sudo yum install -y http://ftp.riken.jp/Linux/fedora/epel/6/i386/epel-release-6-8.noarch.rpm

sudo yum -y install wget vim zsh screen
$ sudo yum install -y gcc gcc-c++ make git openssl-devel zlib-devel readline-devel sqlite-devel bzip2-devel

cd ~
git clone git://github.com/yyuu/pyenv.git .pyenv

cd ~/src
git clone https://github.com/zimbatm/direnv
cd direnv
sudo gem install ronn
make install

# chef install 
curl https://raw.github.com/hnakamur/setup_linux/master/centos6/install_chef-solo.sh | sudo sh

gem install berkshelf

# maven
wget http://ftp.yz.yamagata-u.ac.jp/pub/network/apache/maven/maven-3/3.1.1/binaries/apache-maven-3.1.1-bin.tar.gz
sudo tar -C /usr/local -xzf apache-maven-3.1.1-bin.tar.gz

export M2_HOME=/usr/local/apache-maven-3.1.1

export PATH=$PATH:/usr/local/go/bin

wget http://peak.telecommunity.com/dist/ez_setup.py
python ez_setup.py
easy_install supervisord



