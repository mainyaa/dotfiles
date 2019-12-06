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


# The next line updates PATH for the Google Cloud SDK.
if [ -f '$HOME/src/dotfiles/curl -L https:/raw.githubusercontent.com/git/git/master/contrib/diff-highlight/diff-highlight/google-cloud-sdk/path.bash.inc' ]; then . '$HOME/src/dotfiles/curl -L https:/raw.githubusercontent.com/git/git/master/contrib/diff-highlight/diff-highlight/google-cloud-sdk/path.bash.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '$HOME/src/dotfiles/curl -L https:/raw.githubusercontent.com/git/git/master/contrib/diff-highlight/diff-highlight/google-cloud-sdk/completion.bash.inc' ]; then . '$HOME/src/dotfiles/curl -L https:/raw.githubusercontent.com/git/git/master/contrib/diff-highlight/diff-highlight/google-cloud-sdk/completion.bash.inc'; fi

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('$HOME/anaconda3/bin/conda' 'shell.bash' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "$HOME/anaconda3/etc/profile.d/conda.sh" ]; then
        . "$HOME/anaconda3/etc/profile.d/conda.sh"
    else
        export PATH="$HOME/anaconda3/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<


[[ -s "/Users/kazuyukimori/.gvm/scripts/gvm" ]] && source "/Users/kazuyukimori/.gvm/scripts/gvm"
