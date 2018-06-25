###############
# ENVIRONMENT #
###############
set -x LANG ja_JP.UTF-8


###############
# ENVIRONMENT #
###############
set -x TERM xterm-256color
set -x EDITOR nvim


#########
# ALIAS #
#########
alias cp='cp -iv'
alias grep='grep -rn --color=auto --exclude-dir={.git,dummy} --exclude={dummy,hoge}'
alias ls='ls -aF --color=auto'
alias mkdir='mkdir -p'
alias mv='mv -iv'
alias rm='rm -iv'
alias vim='nvim'
alias ..='cd ..'


##########
# PLUGIN #
##########
# z
command mkdir -p $HOME/.z
set -x Z_CMD 'j'
set -x Z_DATA "$HOME/.z/.z"



##################
# INITIALIZATION #
##################
# tmuxが存在している場合
if string length (type 'tmux') > 0
    if string length ("$TMUX") > 0
        command echo "$TMUX"
    else
        command tmux
    end
end
