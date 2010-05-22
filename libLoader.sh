##
# Source bash functions.
#
# param $@  The name of the file(s) to source.
#

LIB_PATH=${LIB_PATH:-"$HOME/src/bash/lib"}
libLoader()
{
    if [[ $# -gt 0 ]]; then
        for i in "$@"; do
            if [[ -f "$LIB_PATH/$i.sh" ]]; then
                source "$LIB_PATH/$i.sh"
            else
                echo "Fatal error loading library: $i" >&2
            fi
        done
    else
        echo "libLoader requires an argument."
    fi
}
