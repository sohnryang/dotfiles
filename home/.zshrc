export ZSH=$HOME/.oh-my-zsh

plugins=(
    archlinux
    git
    httpie
    npm
    pip
    pylint
    python
    rand-quote
    sudo
    systemd
    vi-mode
    virtualenv
    web-search
    you-should-use
    zsh-autosuggestions
    zsh-hangul
    zsh-syntax-highlighting
)
ZSH_THEME=lambda-minimal

source $ZSH/oh-my-zsh.sh

export LANG=en_US.UTF-8
export VISUAL=nvim
export EDITOR=nvim

# neovim xdg
export XDG_DATA_HOME=$HOME/.local/share

# npm global
export PATH=~/.npm-global/bin:$PATH

# zsh-completions
autoload -U compinit && compinit

# gitignore.io command-line tool
function gi() { curl -L -s https://www.gitignore.io/api/$@ ;}

# editor
export EDITOR=`which vi`

# default user
DEFAULT_USER=`whoami`

# mdcd
function mdcd() {
    mkdir $1
    cd $1
}

function gi() { curl -sLw n https://www.toptal.com/developers/gitignore/api/$@ ;}
