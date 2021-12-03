export DOTFILES=$HOME/.dotfiles
export XDG_CONFIG_HOME=$HOME/.config
export XDG_DATA_HOME="$XDG_CONFIG_HOME/local/share"
export XDG_CACHE_HOME="$XDG_CONFIG_HOME/cache"
export ZDOTDIR="$XDG_CONFIG_HOME/zsh"
export SHELDON_REPOS=$XDG_DATA_HOME/sheldon/repos/github.com

export HISTFILE="$ZDOTDIR/.zhistory"    # History filepath
export HISTSIZE=10000                   # Maximum events for internal history
export SAVEHIST=10000                   # Maximum events in history file
export EDITOR=vim

# set PATH so it includes user's private bin if it exists
if [ -d "$HOME/bin" ] ; then
    PATH="$HOME/bin:$PATH"
fi

# set PATH so it includes user's private bin if it exists
if [ -d "$HOME/.local/bin" ] ; then
    PATH="$HOME/.local/bin:$PATH"
fi
. "$HOME/.cargo/env"
export PYENV_ROOT="$SHELDON_REPOS/pyenv/pyenv"
export NVM_DIR="$SHELDON_REPOS/nvm-sh/nvm"
export PATH="$PYENV_ROOT/bin:$PATH"
$SHELDON_REPOS/junegunn/fzf/install --all --no-fish --no-bash
