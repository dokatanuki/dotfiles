###############
# ENVIRONMENT #
###############
set fish_greeting ''
set -x LANG ja_JP.UTF-8
set -x LC_ALL ja_JP.UTF-8
set -x TERM xterm-256color
set -x EDITOR vim
set -x XDG_CONFIG_HOME ~/.config

## vi mode
function fish_mode_prompt
end
fish_vi_key_bindings


#########
# ALIAS #
#########
alias ag='ag -S'
alias cp='cp -iv'
# alias grep='grep -rn --color=auto --exclude-dir={.git,dummy} --exclude={dummy,hoge}'
alias grep='grep --color=auto --exclude-dir={.git,dummy} --exclude={dummy,hoge}'
alias ls='ls -aF -G'
alias mkdir='mkdir -p'
alias mv='mv -iv'
alias ps='ps -axf'
alias rm='rm -iv'
alias ..='cd ..'


############
# FUNCTION #
############
# Override default cd command
function cd
    builtin cd $argv[1]
    ls
end

# Helper function of prompt view
function _git_branch
    git branch --no-color 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ [\1]/'
end

# Prompt view
function fish_right_prompt
    echo (_git_branch)
end

# Change directory
function j
    z -l | awk '{ print $2 }' | fzf | read selected_dir

    if test -n $selected_dir
        cd $selected_dir
    end
end

alias tmp='nvim /tmp/hoge.md'


##########
# PLUGIN #
##########
# z
eval (mkdir -p $HOME/.z)
set -x Z_CMD 'z'
set -x Z_DATA "$HOME/.z/.z"


#################
# EXTERNAL TOOL #
#################
# fisherman
if not test -f ~/.config/fish/functions/fisher.fish
    curl -sLo ~/.config/fish/functions/fisher.fish --create-dirs git.io/fisher
    fisher
end

# Neovim
if test (string length (type 'nvim' ^/dev/null)) -gt 0 ^/dev/null
    set -x EDITOR nvim
    alias vim='nvim'
end

# Haskell
if test (string length (type 'stack' ^/dev/null)) -gt 0 ^/dev/null
    alias haskell='stack '
end

# Go
set -x GOPATH "$HOME/go"
set -x PATH $GOPATH/bin $PATH

# pyenv, pyenv-virtualenv
if test (string length (type 'pyenv' ^/dev/null)) -gt 0 ^/dev/null
    set -x PYENV_ROOT "$HOME/.pyenv"
    set -x PATH "$PYENV_ROOT/bin" $PATH
    status --is-interactive; and source (pyenv init -|psub); and source (pyenv virtualenv-init -|psub)
end

# rbenv
if test (string length (type 'rbenv' ^/dev/null)) -gt 0 ^/dev/null
    rbenv init - | source
end

# direnv
if test (string length (type 'direnv' ^/dev/null)) -gt 0 ^/dev/null
    eval (direnv hook fish)
end

# fzf
set -x FZF_DEFAULT_COMMAND 'ag --hidden -g ""'
set -x FZF_DEFAULT_OPTS '--height 40% --reverse --border'

# gcc, g++, ccache
set -x CFLAGS '-Wno-error'
set -x CXXFLAGS '-Wno-error'

# tmux: bashから起動, tmuxのデフォルトシェルをfishにしてある
