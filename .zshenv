skip_global_compinit=1
export DOTFILES=$HOME/.dotfiles
export XDG_CONFIG_HOME=$HOME/.config
export XDG_DATA_HOME="$XDG_CONFIG_HOME/local/share"
export XDG_CACHE_HOME="$XDG_CONFIG_HOME/cache"
export ZDOTDIR="$XDG_CONFIG_HOME/zsh"
export PLUGIN_REPOS=$XDG_DATA_HOME/znap

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
export COLORTERM=truecolor
. "$HOME/.cargo/env"
