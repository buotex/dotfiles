zstyle ':znap:*' repos-dir $HOME/.config/local/share/znap
source $HOME/.config/zsh-snap/znap.zsh
set -o emacs
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
#znap source marlonrichert/zsh-autocomplete
znap source romkatv/powerlevel10k
znap source zsh-users/zsh-autosuggestions
znap source zsh-users/zsh-completions
znap source zsh-users/zsh-syntax-highlighting
znap clone asdf-vm/asdf

export ASDF_DIR=${PLUGIN_REPOS}/asdf
fpath=(${ASDF_DIR}/completion $fpath)
path=($path ${ASDF_DIR}/bin)
eval "$(asdf exec direnv hook zsh)"
direnv() { asdf exec direnv "$@"; }
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
eval "$(zoxide init zsh)"


setopt HIST_SAVE_NO_DUPS         # Do not write a duplicate event to the history file.

# Use additional Git repositories pulled in with `z4h install`.

# Autoload functions.
autoload -Uz zmv
source $ZDOTDIR/completion.zsh

# Define named directories: ~w <=> Windows home directory on WSL.
#[[ -n $z4h_win_home ]] && hash -d w=$z4h_win_home

# Set shell options: http://zsh.sourceforge.net/Doc/Release/Options.html.
#setopt glob_dots     # no special treatment for file names with a leading dot
#setopt no_auto_menu  # require an extra TAB press to open the completion menu


#[ -f ~/.direnvrc ] && eval "$(direnv hook zsh)"
export FZF_DEFAULT_COMMAND="fd . $HOME"
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
export FZF_ALT_C_COMMAND="fd -t d . $HOME"


# Extend PATH.
path=($path ~/bin ~/.local/bin )

# To customize prompt, run `p10k configure` or edit ~/.dotfiles/.p10k.zsh.
if [[ $COLORTERM != (24bit|truecolor) && ${terminfo[colors]} -ne 16777216 ]]; then
    zmodload zsh/nearcolor
fi
[[ ! -f ~/.dotfiles/.p10k.zsh ]] || source ~/.dotfiles/.p10k.zsh
source $HOME/.dotfiles/aliases
