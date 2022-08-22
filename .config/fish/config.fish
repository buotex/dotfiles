if status is-interactive
    # Commands to run in interactive sessions can go here
if set -q KITTY_INSTALLATION_DIR
    set --global KITTY_SHELL_INTEGRATION enabled
    source "$KITTY_INSTALLATION_DIR/shell-integration/fish/vendor_conf.d/kitty-shell-integration.fish"
    set --prepend fish_complete_path "$KITTY_INSTALLATION_DIR/shell-integration/fish/vendor_completions.d"
end
end
fish_add_path "$HOME/zls"
set -gx -p CPLUS_INCLUDE_PATH /opt/homebrew/include
set -gx -p LD_LIBRARY_PATH /opt/homebrew/lib
set -gx -p  LIBRARY_PATH /opt/homebrew/lib
alias juliaclient='julia --startup-file=no -e "using DaemonMode; runargs()"'
alias kssh='kitty +kitten ssh'

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
status is-interactive &&
    eval /Users/bxu/opt/miniconda3/bin/conda "shell.fish" "hook" $argv | source
# <<< conda initialize <<<

direnv hook fish | source
