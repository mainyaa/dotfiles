# .bash_profile

# Get the aliases and functions
if [ -f ~/.bashrc ]; then
	. ~/.bashrc
fi

# User specific environment and startup programs

[ -f $HOME/.bash_env ] && source $HOME/.bash_env

export PYENV_ROOT="${HOME}/.pyenv"
if [ -d "${PYENV_ROOT}" ]; then
    export PATH=${PYENV_ROOT}/bin:$PATH
    eval "$(pyenv init -)"
fi
export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)"

[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*

# The next line enables bash completion for gcloud.
source '/private/tmp/google-cloud-sdk/completion.bash.inc'
eval "$(rbenv init -)"

# added by Miniconda2 4.1.11 installer
export PATH="/Users/kazuyukimori/miniconda2/bin:$PATH"

# added by Anaconda3 4.2.0 installer
export PATH="/Users/kazuyukimori/anaconda3/bin:$PATH"

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/kazuyukimori/src/dotfiles/curl -L https:/raw.githubusercontent.com/git/git/master/contrib/diff-highlight/diff-highlight/google-cloud-sdk/path.bash.inc' ]; then . '/Users/kazuyukimori/src/dotfiles/curl -L https:/raw.githubusercontent.com/git/git/master/contrib/diff-highlight/diff-highlight/google-cloud-sdk/path.bash.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/Users/kazuyukimori/src/dotfiles/curl -L https:/raw.githubusercontent.com/git/git/master/contrib/diff-highlight/diff-highlight/google-cloud-sdk/completion.bash.inc' ]; then . '/Users/kazuyukimori/src/dotfiles/curl -L https:/raw.githubusercontent.com/git/git/master/contrib/diff-highlight/diff-highlight/google-cloud-sdk/completion.bash.inc'; fi
