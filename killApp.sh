##
# Utility function to kill a given app only if it's running.
#
# Dependencies:
# * logging.sh
killApp()
{
    [[ -z $1 ]] && die "killApp called without an argument"
    if [[ $(pgrep $1) ]]; then
        killall $1
    fi
}
