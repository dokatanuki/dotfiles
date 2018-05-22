# options zsh5.0.7 [http://vorfee.hatenablog.jp/entry/2015/03/12/182937]
###########################
#  Environment Variables  #
###########################
export LANG=ja_JP.UTF-8
export EDITOR=nvim
## 重複パスを登録しない
typeset -U path cdpath fpath manpath


####################
# general autoload #
####################
# カラーを有効化
autoload -Uz colors && colors
# hookを有効化
autoload -Uz add-zsh-hook
# zshのバージョンを指定して場合分けできる
autoload -Uz is-at-least


##############
# completion #
##############
# 補完機能を有効にする
autoload -Uz compinit && compinit

setopt always_to_end
# setopt complete_in_word
# スペルミスを保管
setopt correct
setopt magic_equal_subst
# リスト表示の時，初めから一つずつ表示する
setopt menu_complete
# コンパクトにしてたくさん候補を表示
setopt list_packed

# 補完で小文字でも大文字にマッチさせる
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'
# ../ の後は今いるディレクトリを補完しない
zstyle ':completion:*' ignore-parents parent pwd ..
# sudo の後ろでコマンド名を補完する
zstyle ':completion:*:sudo:*' command-path /usr/local/sbin /usr/local/bin \
                   /usr/sbin /usr/bin /sbin /bin /usr/X11R6/bin
# ps コマンドのプロセス名補完
zstyle ':completion:*:processes' command 'ps x -o pid,s,args'


#############
# directory #
#############
# ディレクトリ名だけでcdする
setopt auto_cd
# directory stack (pushd, popd, dirs)
# cd したら自動的にpushdする
setopt auto_pushd
# 重複したディレクトリを追加しない
setopt pushd_ignore_dups
# 存在しないディレクトリにアクセスしようとした際にルートに移動する
setopt cdable_vars



############
# vcs_info #
############
autoload -Uz vcs_info

zstyle ':vcs_info:*' formats '%F{green}(%s)-[%b]%f'
zstyle ':vcs_info:*' actionformats '%F{red}(%s)-[%b|%a]%f'

function _update_vcs_info_msg() {
    LANG=en_US.UTF-8 vcs_info
    RPROMPT="${vcs_info_msg_0_}"
}
add-zsh-hook precmd _update_vcs_info_msg


###########
# history #
###########
# 同時に起動したzshの間でヒストリを共有する
setopt share_history
# 同じコマンドをヒストリに残さない
setopt hist_ignore_all_dups
# スペースから始まるコマンド行はヒストリに残さない
setopt hist_ignore_space
# ヒストリに保存するときに余分なスペースを削除する
setopt hist_reduce_blanks

HISTFILE=~/.zsh_history
HISTSIZE=1000000
SAVEHIST=1000000


###########
# keybind #
###########


#########
# alias #
#########
alias ls='ls -F --color=auto'
alias ll='ls -lh'
alias la='ls -lAh'
alias rm='rm -i'
alias cp='cp -i'
alias mv='mv -i'
alias mkdir='mkdir -p'
alias grep='grep --color=auto'
# sudo の後のコマンドでエイリアスを有効にする
alias sudo='sudo '


############
# function #
############
# C で標準出力をクリップボードにコピーする
# mollifier delta blog : http://mollifier.hatenablog.com/entry/20100317/p1
if which pbcopy >/dev/null 2>&1 ; then
    # Mac
    alias -g C='| pbcopy'
elif which xsel >/dev/null 2>&1 ; then
    # Linux
    alias -g C='| xsel --input --clipboard'
elif which putclip >/dev/null 2>&1 ; then
    # Cygwin
    alias -g C='| putclip'
fi

# fzf ヒストリー
function hi() {
  print -z $( ([ -n "$ZSH_NAME" ] && fc -l 1 || history) | fzf +s --tac --height 40% --reverse | sed 's/ *[0-9]* *//')
}


########
# tool #
########
# pyenv, pyenv-virtualenv
export PYENV_ROOT="$HOME/.pyenv"
path=(
	$PYENV_ROOT/bin
	$path
	$HOME/bin
)
eval "$(pyenv init -)"
eval "$(pyenv virtualenv-init -)"

# direnv
eval "$(direnv hook zsh)"

# neovim
if type "nvim" > /dev/null 2>&1; then
	alias vim="nvim"
else
	alias vim="/usr/bin/vim"
fi
export XDG_CONFIG_HOME=~/.config

# tmux
if type "tmux" > /dev/null 2>&1 ; then
	[[ -z "$TMUX" && ! -z "$PS1" ]] && exec tmux
fi

# fzf
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# go
path=(
	$path
	$HOME/.go
)


######
# os # 
######
case ${OSTYPE} in
    darwin*)
        #Mac用の設定
        export CLICOLOR=1
        alias ls='ls -G -Fa'
        ;;
    linux*)
        #Linux用の設定
        alias ls='ls -Fa --color=auto'
        ;;
esac


########
# Misc #
########
# 日本語ファイル名を表示可能にする
setopt print_eight_bit
# beep を無効にする
setopt no_beep
# フローコントロールを無効にする
setopt no_flow_control
# Ctrl+Dでzshを終了しない
setopt ignore_eof
# '#' 以降をコメントとして扱う
setopt interactive_comments
# 高機能なワイルドカード展開を使用する
setopt extended_glob


#########
# zplug #
#########
# install
if [ ! -e $HOME/.zplug ] ; then
    printf "Install zplug? [y/N]: "
    if read -q; then
        curl -sL --proto-redir -all,https https://raw.githubusercontent.com/zplug/installer/master/installer.zsh| zsh
    fi
fi

# initialize
source $HOME/.zplug/init.zsh

# plugin
# completion and linting
zplug "zsh-users/zsh-autosuggestions"
zplug "zsh-users/zsh-completions"
zplug "zsh-users/zsh-syntax-highlighting"
zplug "b4b4r07/enhancd, use:init.sh"

# utils
zplug "zsh-users/zsh-history-substring-search"
zplug "junegunn/fzf-bin, from:gh-r, as:command, rename-to:fzf"

# prompt
zplug "mafredri/zsh-async, from:github"
zplug "sindresorhus/pure, use:pure.zsh, from:github, as:theme"

# install plugin
if ! zplug check ; then
    zplug install
fi

# load plugin
zplug load
