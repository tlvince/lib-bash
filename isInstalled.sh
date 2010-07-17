##
# Check to see if the given application is installed.
#
# @param $1    The application to look for.
# @return      Exit code 0 if installed, otherwise 1.
#
isInstalled()
{
        which "$1" > /dev/null 2>&1 && return 0 || return 1
}
