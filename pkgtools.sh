##
# Install the given packages, firstly searching [core] [extra] and [community],
# then searching [aur].
#
# param $@ string   The package(s) to be installed.
#
install() { sudo pacman -S "$@" || aurget -S "$@"; }

##
# Search for summary information about the given package(s).
#
# param $@ string   The package(s) to search for.
#
pkgsearch() { pacman -Ss "$@" && aurget -Ss "$@"; }

##
# Search for detailed information about the given package(s).
#
# param $@ string   The package(s) to search for.
#
pkginfo() { pacman -Si "$@" && aurget -Si "$@"; }
