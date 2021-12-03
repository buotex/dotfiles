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
eval "$(sheldon source)"


setopt HIST_SAVE_NO_DUPS         # Do not write a duplicate event to the history file.


# Clone additional Git repositories from GitHub.
#
#z4h install ohmyzsh/ohmyzsh || return
#z4h install pyenv/pyenv || return
#z4h install pyenv/pyenv-virtualenv || return
#z4h install pyenv/pyenv-which-ext || return
#z4h install pyenv/pyenv-update || return
#z4h install nvm-sh/nvm || return
#z4h install esc/conda-zsh-completion || return




# Use additional Git repositories pulled in with `z4h install`.
#
# This is just an example that you should delete. It does nothing useful.
#z4h source $Z4H/ohmyzsh/ohmyzsh/plugins/dotenv/dotenv.plugin.zsh
#z4h source $Z4H/ohmyzsh/ohmyzsh/plugins/direnv/direnv.plugin.zsh
#z4h source $Z4H/esc/conda-zsh-completion/conda-zsh-completion.plugin.zsh
## z4h source $Z4H/zsh-pyenv/zsh-pyenv.plugin.zsh
#
## Define key bindings.
#z4h bindkey z4h-backward-kill-zword Ctrl+Alt+Backspace
#
#z4h bindkey undo Ctrl+/  # undo the last command line change
#z4h bindkey redo Alt+/   # redo the last undone command line change
#
#z4h bindkey z4h-cd-back    Alt+Left   # cd into the previous directory
#z4h bindkey z4h-cd-forward Alt+Right  # cd into the next directory
#z4h bindkey z4h-cd-up      Alt+Up     # cd into the parent directory
#z4h bindkey z4h-cd-down    Alt+Down   # cd into a child directory

# Autoload functions.
autoload -Uz zmv
source $ZDOTDIR/completion.zsh

# Define functions and completions.
function md() { [[ $# == 1 ]] && mkdir -p -- "$1" && cd -- "$1" }
compdef _directories md

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

# pyenv
#if [[ ! -d $PYENV_ROOT ]] ;
#then
#    export PYENV_ROOT="$HOME/.pyenv"
#    if [[ ! -d $PYENV_ROOT ]] ;
#    then
#        cp -r $Z4H/pyenv/pyenv $HOME/.pyenv
#    fi
#fi
#  export PATH="$PATH:$Z4H/pyenv/pyenv/bin"
#  eval "$(pyenv init --path)"
#  mkdir -p $PYENV_ROOT/plugins
#  if [[ ! -d $PYENV_ROOT/plugins/pyenv-virtualenv ]]; then; ln -sf $Z4H/pyenv/pyenv-virtualenv $PYENV_ROOT/plugins/pyenv-virtualenv; fi
#  if [[ ! -d $PYENV_ROOT/plugins/pyenv-which-ext ]]; then; ln -sf $Z4H/pyenv/pyenv-which-ext $PYENV_ROOT/plugins/pyenv-which-ext; fi
#  if [[ ! -d $PYENV_ROOT/plugins/pyenv-update ]]; then; ln -sf $Z4H/pyenv/pyenv-update $PYENV_ROOT/plugins/pyenv-update; fi
#  eval "$(pyenv init - --no-rehash zsh)"
#  eval "$(pyenv virtualenv-init - zsh)"
#  source $Z4H/pyenv/pyenv/completions/pyenv.zsh
if [[ -d $PYENV_ROOT ]]; then
   if [[ ! -d $PYENV_ROOT/plugins/pyenv-virtualenv ]]; then; ln -sf $SHELDON_REPOS/pyenv/pyenv-virtualenv $PYENV_ROOT/plugins/pyenv-virtualenv; fi
   if [[ ! -d $PYENV_ROOT/plugins/pyenv-which-ext ]]; then; ln -sf $SHELDON_REPOS/pyenv/pyenv-which-ext $PYENV_ROOT/plugins/pyenv-which-ext; fi
   if [[ ! -d $PYENV_ROOT/plugins/pyenv-update ]]; then; ln -sf $SHELDON_REPOS/pyenv/pyenv-update $PYENV_ROOT/plugins/pyenv-update; fi
fi

eval "$(pyenv init --path)"
eval "$(pyenv init - --no-rehash zsh)"
eval "$(pyenv virtualenv-init - zsh)"

[ -f $Z4H/fzf/fzf.zsh ] && source $Z4H/fzf/fzf.zsh


[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

[ -f ~/.direnvrc ] && eval "$(direnv hook zsh)"


# Extend PATH.
path=($path ~/bin ~/.local/bin )

# To customize prompt, run `p10k configure` or edit ~/.dotfiles/.p10k.zsh.
[[ ! -f ~/.dotfiles/.p10k.zsh ]] || source ~/.dotfiles/.p10k.zsh
source $HOME/.dotfiles/aliases
