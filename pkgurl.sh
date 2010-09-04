##
# pkgurl
#
# Author:   Tom Vincent
# Version:  0.1.2 (2010-04-20)
#
# Open the url of a package into the default browser.
#
# Depends:
# * Aurget
#
pkgurl()
{
    xdg-open $(aurget -Si "$1" | grep "URL *. :" | awk '{print $3}')
}
