function aro --wraps='bass /home/xub2rng/workspace/athena/install_clang/setup.sh; rosrun artifactrepo' --wraps='bass source /home/xub2rng/workspace/athena/install_clang/setup.sh; rosrun artifactrepo' --description 'alias aro=bass source /home/xub2rng/workspace/athena/install_clang/setup.sh; rosrun artifactrepo'
  bass source /home/xub2rng/workspace/athena/install_clang/setup.sh; rosrun artifactrepo $argv; 
end
