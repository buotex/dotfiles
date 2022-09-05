if status is-interactive
    # Commands to run in interactive sessions can go here
    set -Ux EDITOR hx
if set -q KITTY_INSTALLATION_DIR
    set --global KITTY_SHELL_INTEGRATION enabled
    source "$KITTY_INSTALLATION_DIR/shell-integration/fish/vendor_conf.d/kitty-shell-integration.fish"
    set --prepend fish_complete_path "$KITTY_INSTALLATION_DIR/shell-integration/fish/vendor_completions.d"
end
    zoxide init fish | source
    if type -sq exa
        alias ls='exa' 
    end
    alias juliaclient='julia --startup-file=no -e "using DaemonMode; runargs()"'
    alias kssh='kitty +kitten ssh'
end
fish_add_path "$HOME/zls"
    # >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
# <<< conda initialize <<<

direnv hook fish | source
