ZSH=$HOME/.oh-my-zsh
BOXEN=/opt/boxen
[ -f $ZSH/oh-my-zsh.sh ] && source $HOME/.oh-my-zsh/
[ -f $BOXEN/env.sh ] && source $BOXEN/env.sh
# Platform-specific things
case $( uname -s ) in
    Darwin )
        . $HOME/.bash_mac ;;
    Linux )
        . $HOME/.bash_linux ;;
esac
[ -f $HOME/.bash_env ] && source $HOME/.bash_env

# Options
setopt noclobber # don't accidentally overwrite existing files
unsetopt correct && unsetopt correctall # disable zsh autocorrection

# 端末・プロンプトの設定
setopt prompt_subst
autoload -U colors && colors

# http://direnv.net/
eval "$(direnv hook zsh)"

# PCRE 互換の正規表現を使う
setopt re_match_pcre

# プロンプトが表示されるたびにプロンプト文字列を評価、置換する
setopt prompt_subst

# Autocompletion
autoload -U compinit && compinit
zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}'

# Antigen
ANTIGEN=$HOME/.antigen/
# Antigneがなければ落としてくる
[ -f $ANTIGEN/antigen.zsh ] || git clone\
  https://github.com/zsh-users/antigen.git $ANTIGEN

if [[ -f $ANTIGEN/antigen.zsh ]]; then
  source $ANTIGEN/antigen.zsh
  antigen-use oh-my-zsh
  
  if [ "$OSTYPE"="darwin11.0" ]; then
    antigen-bundle osx
  fi
  # Bundles from the default app.
  antigen-bundles <<EOBUNDLES
autojump
brew
bundler
dircycle
gem
git
git-flow
npm
osx
pip
python
rbenv
urltools
zsh-users/zsh-syntax-highlighting
https://github.com/yonchu/grunt-zsh-completion
EOBUNDLES

  # Load the Theme
  antigen-theme candy

  # Tell antigen that you're done.
  antigen-apply
fi
# ホスト名とユーザ名の先頭 4文字をとりだす。全部だと長いので。
h2=`expr $HOST : '\(....\).*'`
u2=`expr $USER : '\(....\).*'`
# 現在のホストによってプロンプトの色を変える。
case "$HOST" in
md*)   col=$fg[red];;  # 赤
ub*)    col=$fg[yellow];;  # 黄
www.l*)    col=$fg[blue];;  # 青
je*)    col=$fg[mazenda];;  # マゼンダ
mo*) col=$fg[green];;  # 緑
*) col=$fg_bold[white];; # それ以外のホストでは強調表示
esac
#PROMPT='${u2}@${h2}%{${col}%}[%c] %{$reset_color%}'
#RPROMPT='${time} %{$fg[magenta]%}$(git_prompt_info)%{$reset_color%}$(git_prompt_status)%{$reset_color%}'
#PROMPT='%{$fg[magenta]%}[%c] %{$reset_color%}'
#RPROMPT='${time} %{$fg[magenta]%}$(git_prompt_info)%{$reset_color%}$(git_prompt_status)%{$reset_color%}'

PROMPT='%{${col}%}${u2}@${h2}%{$reset_color%}:%{$fg[white]%}%c$(git_prompt_info)%{$fg_bold[blue]%}%! %#%{$reset_color%} '
RPROMPT=''

# Aliases
alias ls='ls -GlFta'
alias ll='ls -o'   # 環境によっては -o はなく、-l を使う。
alias la='ls -lag'
alias dus='du -d 1 | sort -n '
alias acki='ack -ai'
alias agi='ag -i'
# grep では LC_CTYPE はセットしない。遅いから。
alias g='env -u LC_CTYPE grep -i'
alias r='env -u LC_CTYPE grep -ir'
alias G='env -u LC_CTYPE grep'
alias F='env -u LC_CTYPE fgrep'
alias c=cat
# 確認つきファイル操作。rm, mv, cp などのあぶない操作はなるべくこれらを使う。
# コマンド名を rm や mv などに上書きしないのは、これらのエイリアスが指定されてない環境
# (root など) でうっかり生の rm などを (-i がついてると思って) 実行してしまうのを防ぐため。
alias rmi='rm -i'
alias mvi='mv -i'
alias cpi='cp -i'
alias lld='ls -ld'
alias ..='cd ..'
alias 644='chmod 644'
alias 755='chmod 755'
alias ox='od -Ax -tx1'
alias dusort='du -d 1 | sort -n'

function trash() {
  for item in "$@"; do
    if [[ -e "$item" ]]; then
      item_name="$(basename $item)"
      if [[ -e "${HOME}/.Trash/${item_name}" ]]; then
        mv -f "$item" "${HOME}/.Trash/${item_name} $(date "+%H-%M-%S")"
      else
        mv -f "$item" "${HOME}/.Trash/"
      fi
    fi
  done
}

# https://github.com/mooz/percol
function ppgrep() {
    if [[ $1 == "" ]]; then
        PERCOL=percol
    else
        PERCOL="percol --query $1"
    fi
    ps aux | eval $PERCOL | awk '{ print $2 }'
}

function ppkill() {
    if [[ $1 =~ "^-" ]]; then
        QUERY=""            # options only
    else
        QUERY=$1            # with a query
        [[ $# > 0 ]] && shift
    fi
    ppgrep $QUERY | xargs kill $*
}
function exists { which $1 &> /dev/null }

if exists percol; then
    function percol_select_history() {
        local tac
        exists gtac && tac="gtac" || { exists tac && tac="tac" || { tac="tail -r" } }
        BUFFER=$(fc -l -n 1 | eval $tac | percol --query "$LBUFFER")
        CURSOR=$#BUFFER         # move cursor
        zle -R -c               # refresh
    }

    zle -N percol_select_history
    bindkey '^T' percol_select_history
fi

PATH=$PATH:$HOME/.rvm/bin # Add RVM to PATH for scripting
export PYENV_ROOT="${HOME}/.pyenv"
if [ -d "${PYENV_ROOT}" ]; then
    export PATH=${PYENV_ROOT}/bin:$PATH
    eval "$(pyenv init -)"
fi
