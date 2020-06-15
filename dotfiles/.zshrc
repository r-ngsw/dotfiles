
######################################
# 環境変数
export LANG=ja_JP.UTF-8


# 色を使用出来るようにする
autoload -Uz colors
colors

# emacs 風キーバインドにする
bindkey -e

# ヒストリの設定
HISTFILE=~/.zsh_history
HISTSIZE=1000000
SAVEHIST=1000000

# ヒストリーに重複を表示しない
setopt histignorealldups

# ヒストリーに日付を表示
alias h='fc -lt '%F %T' 1'

# 履歴をすぐに追加する
setopt inc_append_history

# 全履歴を一覧表示
function history-all { history -E 1 }

# インクリメンタルからの検索
bindkey '^R' history-incremental-pattern-search-backward

# ビープ音削除
setopt no_beep

#####################################
# プロンプト
# 1行表示
# PROMPT="%~ %# "
# 2行表示
PROMPT="%{${fg[green]}%}[%n@%m]%{${reset_color}%} %~
%# "

##############################
# エイリアス

alias la='ls -a'
alias ll='ls -l'

alias rm='rm -i'
alias cp='cp -i'
alias mv='mv -i'

alias mkdir='mkdir -p'

# sudo の後のコマンドでエイリアスを有効にする
alias sudo='sudo '

# グローバルエイリアス
alias -g L='| less'
alias -g G='| grep'

#####################################
# OS 別の設定
case ${OSTYPE} in
    darwin*)
        #Mac用の設定
        export CLICOLOR=1
        alias ls='ls -G -F'
        ;;
    linux*)
        #Linux用の設定
        alias ls='ls -F --color=auto'
        ;;
esac

####################################################
# node,direnv Setting
NODEBREW_HOME=/usr/local/var/nodebrew/current
export NODEBREW_HOME
export NODEBREW_ROOT=/usr/local/var/nodebrew

export PATH=$PATH:$NODEBREW_HOME/bin

eval "$(direnv hook zsh)"
export PATH=$HOME/.nodebrew/current/bin:$PATH
export EDITOR=vim

export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)"
export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"
