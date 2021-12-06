set -o emacs
[ -f ~/.$(hostname).zsh ] && source ~/.$(hostname).zsh
zstyle ':znap:*' repos-dir $PLUGIN_REPOS
source ~/.config/zsh-snap/znap.zsh
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
#znap source marlonrichert/zsh-autocomplete
znap source romkatv/powerlevel10k
znap source zsh-users/zsh-autosuggestions
znap source zsh-users/zsh-completions
znap source zsh-users/zsh-syntax-highlighting
znap clone asdf-vm/asdf

export ASDF_DIR=${PLUGIN_REPOS}/asdf
fpath=(${ASDF_DIR}/completion $fpath)
path=($path ${ASDF_DIR}/bin)
znap eval direnv-init 'asdf exec direnv hook zsh'
direnv() { asdf exec direnv "$@"; }
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
znap eval zoxide-init 'zoxide init zsh'


# Autoload functions.

znap eval ls_colors 'export LS_COLORS=$(vivid generate snazzy)'
autoload -Uz zmv
source $ZDOTDIR/completion2.zsh

# Set shell options: http://zsh.sourceforge.net/Doc/Release/Options.html.
setopt glob_dots     # no special treatment for file names with a leading dot
#setopt no_auto_menu  # require an extra TAB press to open the completion menu


#[ -f ~/.direnvrc ] && eval "$(direnv hook zsh)"
export FZF_ALT_C_COMMAND="fd -t d . $HOME --color=always"
export FZF_DEFAULT_COMMAND="fd --color=always"
export FZF_DEFAULT_OPTS="--ansi"
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"


# Extend PATH.
path=($path ~/bin ~/.local/bin )

# To customize prompt, run `p10k configure` or edit ~/.dotfiles/.p10k.zsh.
if [[ $COLORTERM != (24bit|truecolor) && ${terminfo[colors]} -ne 16777216 ]]; then
    zmodload zsh/nearcolor
fi
[[ ! -f ~/.dotfiles/.p10k.zsh ]] || source ~/.dotfiles/.p10k.zsh
bindkey -M menuselect '^M' .accept-line
bindkey -M menuselect '^[[Z' reverse-menu-complete
bindkey "^[[3~" delete-char
source $HOME/.dotfiles/aliases
