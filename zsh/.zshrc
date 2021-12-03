# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# Export environment variables.
export GPG_TTY=$TTY

# Personal Zsh configuration file. It is strongly recommended to keep all
# shell customization and configuration (including exported environment
# variables such as PATH) in this file or in files source by it.
#
# Documentation: https://github.com/romkatv/zsh4humans/blob/v4/README.md.
[ -f ~/.$(hostname).zsh ] && source ~/.$(hostname).zsh
if  [[ ! -d $XDG_CONFIG_HOME/sheldon ]]; then 
  mkdir -p $XDG_CONFIG_HOME/sheldon
  ln -sf $DOTFILES/plugins.toml $XDG_CONFIG_HOME/sheldon
fi
eval "$(sheldon source)"


setopt HIST_SAVE_NO_DUPS         # Do not write a duplicate event to the history file.

# Use additional Git repositories pulled in with `z4h install`.

# Autoload functions.
autoload -Uz zmv
source $ZDOTDIR/completion.zsh
bindkey -M menuselect '^[[Z' reverse-menu-complete

# Define named directories: ~w <=> Windows home directory on WSL.
#[[ -n $z4h_win_home ]] && hash -d w=$z4h_win_home

# Set shell options: http://zsh.sourceforge.net/Doc/Release/Options.html.
setopt glob_dots     # no special treatment for file names with a leading dot
setopt no_auto_menu  # require an extra TAB press to open the completion menu

# fnm
#z4h install Schniz/fnm || return
#export PATH=$HOME/.fnm:$PATH
#if (( $+commands[fnm] )); then
#    eval "`fnm env --multi`"
#fi

#nvm

# Enable direnv hooks if direnv is installed.
if (( $+commands[direnv] )); then
  eval "$(direnv hook zsh)"
fi

if [[ -d $PYENV_ROOT ]]; then
   if [[ ! -d $PYENV_ROOT/plugins/pyenv-virtualenv ]]; then; ln -sf $SHELDON_REPOS/pyenv/pyenv-virtualenv $PYENV_ROOT/plugins/pyenv-virtualenv; fi
   if [[ ! -d $PYENV_ROOT/plugins/pyenv-which-ext ]]; then; ln -sf $SHELDON_REPOS/pyenv/pyenv-which-ext $PYENV_ROOT/plugins/pyenv-which-ext; fi
   if [[ ! -d $PYENV_ROOT/plugins/pyenv-update ]]; then; ln -sf $SHELDON_REPOS/pyenv/pyenv-update $PYENV_ROOT/plugins/pyenv-update; fi
   eval "$(pyenv init --path)"
   eval "$(pyenv init - --no-rehash zsh)"
   eval "$(pyenv virtualenv-init - zsh)"
fi


[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

[ -f ~/.direnvrc ] && eval "$(direnv hook zsh)"


# Extend PATH.
path=($path ~/bin ~/.local/bin )

# To customize prompt, run `p10k configure` or edit ~/.dotfiles/.p10k.zsh.
if [[ $COLORTERM != (24bit|truecolor) && ${terminfo[colors]} -ne 16777216 ]]; then
    zmodload zsh/nearcolor
fi
[[ ! -f ~/.dotfiles/.p10k.zsh ]] || source ~/.dotfiles/.p10k.zsh
source $HOME/.dotfiles/aliases
set -o emacs
