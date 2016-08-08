
# .bashrc

# User specific aliases and functions

# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

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

# Platform-specific things
case $( uname -s ) in
    Darwin )
        source_if_exists $HOME/.bash_mac ;;
    Linux )
        source_if_exists $HOME/.bash_linux ;;
esac

## 新しく作られたファイルのパーミッションがつねに 644 になるようにする
umask 022

## core ファイルを作らせないようにする
ulimit -c 0

## 環境変数の設定

# man とかを見るときはいつも less を使う。
export PAGER=less
# less のステータス行にファイル名と行数、いま何%かを表示するようにする。
# 設定するとカラーがおかしくなるからコメントアウト
#export LESS='-X -i -P ?f%f:(stdin).  ?lb%lb?L/%L..  [?eEOF:?pb%pb\%..]'

# 色付き
alias diff='colordiff'
alias less='less -R'

# rsync では ssh を使う
export RSYNC_RSH=ssh

# backspace
#stty erase "^?"

# "." コマンドでシェルスクリプトを実行するときは混乱するので PATH を検索させない。
shopt -u sourcepath

RPROMPT='[`rprompt-git-current-branch`%~]'

# 対話的モードなら環境変数 PS1 (プロンプト文字列) が設定されている
# はずなので、それを調べる。
if [[ "$PS1" ]]; then

  # この中は対話的モードだ。

  # bashオプション設定

  # EOF (Ctrl-D) 入力は 10回まで許可。
  IGNOREEOF=10
  # 履歴のサイズ。新山の場合はこれで半年ぐらい前のやつまで残る。
  HISTSIZE=50000
  HISTFILESIZE=50000

  # 履歴ファイルを上書きではなく追加する。
  # 複数のホストで同時にログインすることがあるので、上書きすると危険だ。
  shopt -s histappend
  # "!"をつかって履歴上のコマンドを実行するとき、
  # 実行するまえに必ず展開結果を確認できるようにする。
  shopt -s histverify
  # 履歴の置換に失敗したときやり直せるようにする。
  shopt -s histreedit
  # 端末の画面サイズを自動認識。
  shopt -s checkwinsize
  # "@" のあとにホスト名を補完させない。
  shopt -u hostcomplete
  # つねにパス名のテーブルをチェックする。
  shopt -s checkhash
  # なにも入力してないときはコマンド名を補完しない。
  # (メチャクチャ候補が多いので。)
  shopt -s no_empty_cmd_completion

  # i: 直前の履歴 30件を表示する。引数がある場合は過去 1000件を検索する。
  # (history で履歴全部を表示させると多すぎるので)
  function i {
      if [ "$1" ]; then history 1000 | grep "$@"; else history 30; fi
  }
  # I: 直前の履歴 30件を表示する。引数がある場合は過去のすべてを検索する。
  function I {
      if [ "$1" ]; then history | grep "$@"; else history 30; fi
  }

  # GNU screen 用のコマンド。引数を screen のステータス行に表示。
  function dispstatus {
      if [[ "$STY" ]]; then echo -en "\033k$1\033\134"; fi
  }

  # 端末・プロンプトの設定

  # ホスト名とユーザ名の先頭 4文字をとりだす。全部だと長いので。
  h2=`expr $HOSTNAME : '\(....\).*'`
  u2=`expr $USER : '\(....\).*'`
  # 現在のホストによってプロンプトの色を変える。
  case "$HOSTNAME" in
  ma*)   col=31;;  # 赤
  md*)    col=32;;  # 緑
  ub*)    col=33;;  # 黄
  www.l*)    col=34;;  # 青
  je*)    col=35;;  # マゼンダ
  mo*) col=36;;  # 水色
  *) col=1;; # それ以外のホストでは強調表示
  esac
  if [[ "$EMACS" ]]; then
    # emacs の shell モードでは制御文字を使わない簡単なプロンプト
    stty -echo nl
    PS1="$u2@$h2\w\$ "
  else
    # プロンプトの設定
    if [[ "$SHELLTYPE" = session ]]; then
      # ある端末では短いプロンプトにする。
      PS1='$h2$ ';
      unset SHELLTYPE
    else
      PS1="$u2@$h2\[\e[${col}m\]\w[\!]\$\[\e[m\] "
    fi
    # 通常のプロンプト PS1 に加えて PS0 という変数を設定する。
    # (これは bash は何も関知しない、あとで述べる px というコマンドが使う)
    # 通常のプロンプトでは現在のカレントディレクトリのフルパス名を
    # 表示するようになっているが、これが長すぎるときに PS1 と PS0 を
    # 一時的に切り換えて使う。
    PS0="$u2@$h2:\[\e[${col}m\]\W[\!]\$\[\e[m\] "

    # 端末の設定
    eval `SHELL=sh tset -sQI`
    stty dec crt erase ^H eof ^D quit ^\\ start ^- stop ^-
  fi

  # 履歴つき cd
  # http://www.unixuser.org/~euske/doc/bashtips/cdhist.sh
  . ~/src/dotfiles/cdhist.sh

  # いろんな関数

  # つねに直前のコマンドの終了状態をチェックさせる。
  # もし異常終了した場合は、その状態(数値)を表示する。
  function showexit {
    local s=$?
    dispstatus "${PWD/\/root/~}"
    if [[ $s -eq 0 ]]; then return; fi
    echo "exit $s"
  }
  PROMPT_COMMAND=showexit

  # px: 長いプロンプトと短いプロンプトを切り換える。
  function px {
      local tmp=$PS1; PS1=$PS0; PS0=$tmp;
  }

  # h: csh における which と同じ。
  function h { command -v $1; }

  # wi: whatis の略。指定されたコマンドの実体を表示。
  function wi {
    case `type -t "$1"` in
     alias|function) type "$1";;
     file) L `command -v "$1"`;;
     function) type "$1";;
    esac
  }

  # 現在実行中のジョブを表示。
  function j { jobs -l; }

  # Perl のワンライナー補助。
  function P { perl -e 'sub f{'"$*"';}print &f(@ARGV),"\n";'; }

  # Wordnet を検索。
  function wng { wn $1 -grepn -grepa -grepv; }

  # 雑多な手抜き用コマンド。
  function tmp { cd ~/tmp; }
  function m { dispstatus Mutt; mutt "$@"; }
  function s { m -f +$1; }

  # SSH の設定

  # この bashrc が実行されるケースは 3つある。
  #   a. リモートホストにログインした場合で、agent 転送可能なとき。
  #   b. ローカルホストにログインした場合で、すでに agent が起動しているとき。
  #   c. ローカルホストにログインした場合で、まだagentが起動していないとき。

  # ssh-agent は各ホストにひとつしか起動させたくない。
  # しかし、X を使っている環境では、複数のウインドウから agent にアクセス
  # する必要がある。これをするために、ssh-agent の通信用ソケットは
  # つねに決まった場所 (~/.ssh/sock.ホスト名) に作るようにして、
  # そこを調べれば (SSH_AUTH_SOCK を指定して ssh-add を実行する)、
  # agent が起動しているかどうかわかるようにしたい。

  # ログは ~/.ssh/agent.log に残される。
  export SSH_AGENT_LOG=$HOME/.ssh/agent.log

  # まず、ssh-agent と通信可能かどうかをチェックする。
  # すでに agent が起動している場合か、リモートホスト上に
  # agent が転送されている場合は SSH_AUTH_SOCK が最初から設定されていて
  # 通信可能なはず。

  # これは ssh-add -l の終了状態を調べることによっておこなう。
  # ssh-add -l は、agent との通信が可能でなおかつ使用可能な鍵があれば
  # 正常終了し (終了状態 0)、agent との通信は可能だが使用可能な鍵がない場合は、
  # 終了状態 1 で異常終了する。agent との通信は可能でない場合は 終了状態 2 で
  # 異常終了するので、これを調べればよい。
  if ssh-add -l >/dev/null 2>&1; then
      # 通信可能で、鍵がすでにあった。
      #echo "The agent has a key."
      :
  elif [ 2 = "$?" ]; then
      # つぎにローカルな ssh-agent が起動しているかどうかチェックする。
      export SSH_AUTH_SOCK=$HOME/.ssh/sock.`hostname`
      if ssh-add -l >/dev/null 2>&1; then
          # ローカルな agent がすでに起動していた。
          #echo "The agent does not have a key."
          :
      elif [ 2 = "$?" -a ! "$SSH_CLIENT" ]; then
          # agent が起動していなかった。ので、起動させる。
          # この場合、通信用のソケットはつねに決まったパスにする。
          #echo "Cannot find an agent, launching."
	  rm -f $SSH_AUTH_SOCK
	  eval `ssh-agent -a $SSH_AUTH_SOCK`
	  echo -n `date` : 'ssh-agent started at' `hostname` : $SSH_AUTH_SOCK : $SSH_AGENT_PID >>$SSH_AGENT_LOG
      fi
  fi

  # エージェントに鍵を追加するコマンド。ssh-add で鍵があるかどうか調べ、
  # なければパスフレーズを要求する。ssh のさいに自動的に実行される。
  function sshon1 {
      if ! (ssh-add -l 2>&1 | grep '(RSA1)' >&2 ); then
          ssh-add -t 60m ~/.ssh/identity &&
	  echo `date` : 'identity is added at' `hostname` >>$SSH_AGENT_LOG
      fi
  }
  function sshon2 {
      if ! (ssh-add -l 2>&1 | grep '(DSA)' >&2 ); then
          ssh-add -t 60m ~/.ssh/id_dsa_orange &&
	  echo `date` : 'id_dsa_orange is added at' `hostname` >>$SSH_AGENT_LOG
      fi
  }

  # ふだんは ssh のかわりに ssh1 と ssh2 というコマンドを使う。
  # これはエージェントに鍵がなければパスフレーズを要求して追加しようとする。
  alias sshon=sshon2
  function ssh1 { sshon1 && command ssh -1 "$@"; }
  function ssh2 { sshon2 && command ssh -2 "$@"; }

  # wg: ダウンロードの進行状況を見るコマンド。
  # Lynx で何かダウンロードするとき、wget のログをつねに
  # ~/.wgetlog に 追記するようにしてある。
  function wg { tail ~/.wgetlog; }
  function lynx { dispstatus Lynx; command lynx "$@"; }

  # エイリアス。

  alias ls='ls -F'
  alias ll='ls -o'   # 環境によっては -o はなく、-l を使う。
  alias la='ls -lag'
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
  # rmはゴミ箱に移動
  #function rm () {
  #  local path
  #  for path in "$@"; do
  #    if [[ "$path" != -* ]]; then
  #      /usr/local/bin/trash "$path"
  #    fi
  #  done
  #}
  alias dusort='du -d 1 | sort -n'

  # 補完の設定。あまり詳しくは設定してない。
  complete -d cd
  complete -c man
  complete -c h
  complete -c wi
  complete -v unset

  if [ -f ~/.bashrc_local ]; then
      . ~/.bashrc_local
  fi

  # mac固有の設定。
  if [ -f ~/.bashrc_mac ]; then
      . ~/.bashrc_mac
  fi
fi

# grunt completion
if [ -f $(which grunt) ]; then
  eval "$(grunt --completion=bash)"
fi

# http://www.direnv.net/
if [ -f $(which direnv) ]; then
  eval "$(direnv hook bash)"
fi

# pythonbrew
source_if_exists $HOME/.pythonbrew/etc/bashrc

# Import virtualenvwrapper
source_if_exists ~/.virtualenvwrapper_bashrc

export PYENV_ROOT="${HOME}/.pyenv"
if [ -d "${PYENV_ROOT}" ]; then
    export PATH=${PYENV_ROOT}/bin:$PATH
    eval "$(pyenv init -)"
fi

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

alias mvn=color_maven

export PATH="$PATH:$HOME/.rvm/bin" # Add RVM to PATH for scripting

# The next line updates PATH for the Google Cloud SDK.
source '/private/tmp/google-cloud-sdk/path.bash.inc'

# The next line enables bash completion for gcloud.
source '/private/tmp/google-cloud-sdk/completion.bash.inc'

export NVM_DIR="/Users/kazuyukimori/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"  # This loads nvm
export NODE_PATH=/usr/local/lib/node_modules:/Users/kazuyukimori/.nodebrew/node/v6.0.0/lib/node_modules
