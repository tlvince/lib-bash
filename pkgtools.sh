##
# Install the given packages, firstly searching [core] [extra] and [community],
# then searching [aur].
#
# param $@ string   The package(s) to be installed.
#
install() { sudo pacman -S "$@" || aurget -S "$@"; }

##
# Search for summary information about the given package.
#
# param $1 string   The package to search for.
#
pkgsearch() { pacman -Ss "$1"; aurget -Ss "$1"; }

##
# Search for detailed information about the given package.
#
# param $1 string   The package to search for.
#
pkginfo() { pacman -Si "$1" 2>/dev/null; aurget -Si "$1"; }
