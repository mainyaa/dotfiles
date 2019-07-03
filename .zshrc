ZSH=$HOME/.oh-my-zsh
function export_first_path_if_exists() {
    test -d "$1" && export PATH="$1:$PATH"
}
function export_path_if_exists() {
    test -d "$1" && export PATH="$1:$PATH"
}
function source_if_exists() {
    test -f "$1" && source "$1"
}
function eval_if_exists() {
    test -f $(which $1) && eval "$2"
}
function sleep() {
    for i in {$1..0}; do
        printf '\r%2d' $i
        /bin/sleep 1
    done
    printf '\n'
}
# Antigen
bindkey '\e[A' history-substring-search-up
bindkey '\e[B' history-substring-search-down
#source /usr/local/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source /usr/local/Cellar/zsh-history-substring-search/1.0.1/share/zsh-history-substring-search/zsh-history-substring-search.zsh
source $HOME/.zshrc.antigen
# Platform-specific things
case $( uname -s ) in
    Darwin )
        source $HOME/.bash_mac ;;
    Linux )
        source $HOME/.bash_linux ;;
esac
source $HOME/.bash_env

# Options
setopt noclobber # don't accidentally overwrite existing files
unsetopt correct && unsetopt correctall # disable zsh autocorrection

# 端末・プロンプトの設定
setopt prompt_subst
autoload -U colors && colors

# PCRE 互換の正規表現を使う
#setopt re_match_pcre

# カッコの対応などを自動的に補完
setopt auto_param_keys

# ディレクトリ名の補完で末尾の / を自動的に付加し、次の補完に備える
setopt auto_param_slash

# auto_list の補完候補一覧で、ls -F のようにファイルの種別をマーク表示しない
setopt NO_list_types

# コマンドラインの引数で --prefix=/usr などの = 以降でも補完できる
setopt magic_equal_subst

# ファイル名の展開でディレクトリにマッチした場合末尾に / を付加する
setopt mark_dirs

# 8 ビット目を通すようになり、日本語のファイル名を表示可能
setopt print_eight_bit

# Autocompletion
autoload -U compinit && compinit
zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}'


# ホスト名とユーザ名の先頭 4文字をとりだす。全部だと長いので。
h2=`expr $HOST : '\(....\).*'`
u2=`expr $USER : '\(....\).*'`
# 現在のホストによってプロンプトの色を変える。
case "$HOST" in
md*)   col=$fg[red];;  # 赤
ub*)    col=$fg[yellow];;  # 黄
www*)    col=$fg[blue];;  # 青
We*)    col=$fg[mazenda];;  # マゼンダ
mo*) col=$fg[green];;  # 緑
mai*) col=$fg[green];;  # 緑
kazu*) col=$fg[green];;  # 緑
*) col=$fg_bold[white];; # それ以外のホストでは強調表示
esac
#PROMPT='${u2}@${h2}%{${col}%}[%c] %{$reset_color%}'
#RPROMPT='${time} %{$fg[magenta]%}$(git_prompt_info)%{$reset_color%}$(git_prompt_status)%{$reset_color%}'
#PROMPT='%{$fg[magenta]%}[%c] %{$reset_color%}'
#RPROMPT='${time} %{$fg[magenta]%}$(git_prompt_info)%{$reset_color%}$(git_prompt_status)%{$reset_color%}'

PROMPT='%{${col}%}${u2}@${h2}%{$reset_color%}:%{$fg[white]%}%c$(git_prompt_info)%{$fg_bold[blue]%}ヾ(๑╹◡╹)ﾉ %#%{$reset_color%} '
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
alias diff='colordiff'
alias less='less -R'


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

function exists { which $1 &> /dev/null }

# http://www.direnv.net/
eval_if_exists direnv "$(direnv hook zsh)"

# https://github.com/builddoctor/maven-antsy-color/
# thanks to:  http://blog.blindgaenger.net/colorize_maven_output.html
# and: http://johannes.jakeapp.com/blog/category/fun-with-linux/200901/maven-colorized
# Colorize Maven Output
alias maven="command mvn"
function color_maven() {
    local BLUE="[0;34m"
    local RED="[0;31m"
    local LIGHT_RED="[1;31m"
    local LIGHT_GRAY="[0;37m"
    local LIGHT_GREEN="[1;32m"
    local LIGHT_BLUE="[1;34m"
    local LIGHT_CYAN="[1;36m"
    local YELLOW="[1;33m"
    local WHITE="[1;37m"
    local NO_COLOUR="[0m"
    maven "$@" | sed \
        -e "s/Tests run: \([^,]*\), Failures: \([^,]*\), Errors: \([^,]*\), Skipped: \([^,]*\)/${LIGHT_GREEN}Tests run: \1$NO_COLOUR, Failures: $RED\2$NO_COLOUR, Errors: $YELLOW\3$NO_COLOUR, Skipped: $LIGHT_BLUE\4$NO_COLOUR/g" \
        -e "s/\(\[\{0,1\}WARN\(ING\)\{0,1\}\]\{0,1\}.*\)/$YELLOW\1$NO_COLOUR/g" \
        -e "s/\(\[ERROR\].*\)/$RED\1$NO_COLOUR/g" \
        -e "s/\(\(BUILD \)\{0,1\}FAILURE.*\)/$RED\1$NO_COLOUR/g" \
        -e "s/\(\(BUILD \)\{0,1\}SUCCESS.*\)/$LIGHT_GREEN\1$NO_COLOUR/g" \
        -e "s/\(\[INFO\].*\)/$LIGHT_GRAY\1$NO_COLOUR/g"
    return $PIPESTATUS
}

#alias mvn=color_maven

# https://github.com/zsh-users/zaw#usage
#eval_if_exists $HOME/local/zaw/zaw.zsh ". $HOME/local/zaw/zaw.zsh"
#bindkey '^R' zaw-history
bindkey "^G" zaw
if [ ~/.zshrc -nt ~/.zshrc.zwc ]; then
  zcompile ~/.zshrc
fi



# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('$HOME/anaconda3/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
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

