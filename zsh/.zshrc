export ZSH=$HOME/.oh-my-zsh

if [[ "$OSTYPE" == "darwin"* ]] then
  fpath=( /opt/homebrew/share/zsh/site-functions "${fpath[@]}" )
fi

plugins=(
  git
  golang
  httpie
  npm
  pip
  pylint
  python
  rand-quote
  rust
  sudo
  vi-mode
  virtualenv
  web-search
  zsh-syntax-highlighting
)
if [[ "$OSTYPE" == "linux-gnu"* ]]; then
  plugins+=(
    archlinux
    systemd
  )
fi

ZSH_THEME=lambda-minimal

source $ZSH/oh-my-zsh.sh

export LANG=en_US.UTF-8
export VISUAL=nvim
export EDITOR=nvim

export ZSH_HIGHLIGHT_STYLES[comment]='none'

# neovim xdg
export XDG_DATA_HOME=$HOME/.local/share

# npm global
export PATH=~/.npm-global/bin:$PATH

# zsh-completions
autoload -U compinit
compinit -i

# gitignore.io command-line tool
function gi() { curl -L -s https://www.gitignore.io/api/$@ ;}

# editor
export EDITOR=`which nvim`

# default user
DEFAULT_USER=`whoami`

# mdcd
function mdcd() {
  mkdir $1
  cd $1
}

function gi() { curl -sLw "\n" https://www.toptal.com/developers/gitignore/api/$@ ;}

export PATH=$HOME/.local/bin:$HOME/.cargo/bin:$PATH
export PATH="$HOME/opt/cross/bin:$PATH"

if [[ "$OSTYPE" == "darwin"* ]]; then
  export PATH="/opt/homebrew/opt/llvm/bin:$PATH"
  export LDFLAGS="-L/opt/homebrew/opt/llvm/lib"
  export CPPFLAGS="-I/opt/homebrew/opt/llvm/include"
fi

eval $(thefuck --alias)
