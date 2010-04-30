#
# Check if the current user is root.
#
# Version:  0.1.2 (2010-04-25)
#
rootCheck()
{
    if [[ $EUID -ne 0 ]]; then
        echo "${NAME:-$(basename $0)} must be run as root" 1>&2
        exit 1
    fi
}
