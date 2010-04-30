#
# cd to the parent directory a given amount of times.
# From: http://bbs.archlinux.org/viewtopic.php?pid=433946#p433946
#
# param $1  The amount of levels up to travel.
#
up()
{
    for updirs in $(seq ${1:-1}); do
        cd ..
    done
}
