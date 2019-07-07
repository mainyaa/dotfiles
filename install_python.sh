set -ux

echo "### Install python"

if [ -d $HOME/anaconda3/ ]; then
    :
else
    wget https://repo.continuum.io/miniconda/Anaconda3-3.7.0-Linux-x86_64.sh -O ~/anaconda.sh
    bash ~/anaconda.sh -b -p $HOME/anaconda3
fi
export PATH="$HOME/anaconda3/bin:$PATH"
conda init $(basename $SHELL)
. $HOME/$(basename $SHELL)rc
conda activate base

pip install virtualenv
pip install virtualenvwrapper
pip install pip-tools
pip install awscli
pip install aws-google-auth
pip install logcat-color
pip install asciinema
pip install pychecker
pip install pep8
pip install pyflakes
pip install flake8
pip install flake8-mypy
pip install mypy
pip install mypy

