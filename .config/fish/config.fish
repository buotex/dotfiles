if status is-interactive
    # Commands to run in interactive sessions can go here
    fzf_configure_bindings --directory=\cf
    fish_add_path "$HOME/.local/bin"
    fish_add_path "$HOME/zls"
    fish_add_path "$HOME/cargo/bin"
    if type -sq nvm
        nvm use lts
    end
    set -Ux EDITOR lvim
if set -q KITTY_INSTALLATION_DIR
    set --global KITTY_SHELL_INTEGRATION enabled
    source "$KITTY_INSTALLATION_DIR/shell-integration/fish/vendor_conf.d/kitty-shell-integration.fish"
    set --prepend fish_complete_path "$KITTY_INSTALLATION_DIR/shell-integration/fish/vendor_completions.d"
end
if type -sq direnv
direnv hook fish | source
end
    if type -sq zoxide
    	zoxide init fish | source
    end
    if type -sq exa
        alias ls='exa' 
    end
    if type -sq lazygit
      alias lg='lazygit'
    end
    alias juliaclient='julia --startup-file=no -e "using DaemonMode; runargs()"'
    alias kssh='kitty +kitten ssh'
end

    # >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
# <<< conda initialize <<<

