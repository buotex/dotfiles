function cpkitty
  infocmp -a xterm-kitty | ssh $argv tic -x -o \~/.terminfo /dev/stdin
end
