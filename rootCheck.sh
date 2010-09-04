##
# Check if the current user is root, otherwise exit.
#
rootCheck()
{
    if [[ $EUID -ne 0 ]]; then
        echo "${0##*/} must be run as root" >&2
        exit 1
    fi
}
