# All subcommands that catkin knows - this is useful for later.
set -l commands build clean config create env init list locate package profile test test_only
function __fish_catkin_list_projects
    catkin list -u --quiet
end

# Disable file completions for the entire command
# because it does not take files anywhere
# Note that this can be undone by using "-F".
#
# File completions also need to be disabled
# if you want to have more control over what files are offered
# (e.g. just directories, or just files ending in ".mp3").
complete -c catkin -f

complete -x -c catkin -n "not __fish_seen_subcommand_from $commands" \
    -a "$commands"


# If the "set-timezone" subcommand is used,
# offer the output of `timedatectl list-timezones` as completions.
# Each line of output is used as a separate candidate,
# and anything after a tab is taken as the description.
# It's often useful to transform command output with `string` into that form.
complete -x -c catkin -n "__fish_seen_subcommand_from build clean test" \
    -a '(__fish_catkin_list_projects)'


# These are simple options that can be used everywhere.
complete -c catkin -s h -l help -d 'Print a short help text and exit'
complete -c catkin -l version -d 'Print a short version string and exit'
complete -c catkin -l no-pager -d 'Do not pipe output into a pager'
