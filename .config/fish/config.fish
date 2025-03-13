if status is-interactive
    # Commands to run in interactive sessions can go here
    fzf_configure_bindings --directory=\cf
    fish_add_path -g "$HOME/.local/bin"
    fish_add_path -g "$HOME/zls"
    fish_add_path -g "$HOME/.cargo/bin"
    if type -sq nvm
        nvm use lts
    end
    set -Ux EDITOR lvim
    set -Ux AZCOPY_CONCURRENCY_VALUE 4
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
      abbr --add lg lazygit
    end
    abbr --add cb catkin build
    abbr --add cbn catkin build --no-deps
    alias juliaclient='julia --startup-file=no -e "using DaemonMode; runargs()"'
    alias kssh='kitty +kitten ssh'
    set -Ux PYTHONBREAKPOINT ipdb.set_trace
    source $HOME/.local.fish
end

    # >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
# <<< conda initialize <<<

