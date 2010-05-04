##
# pkgurl
#
# Author:   Tom Vincent
# Version:  0.1.2 (2010-04-20)
#
# Open the url of a package into the default browser.
#
# Depends:
# * Bauerbill
#
pkgurl()
{
    xdg-open $(bauerbill -Si --aur $1 | grep "URL *. :" | awk '{print $3}')
}
