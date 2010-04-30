# Title:    Bash bookmarking.
# Author:   scragar
# Source:   http://bbs.archlinux.org/viewtopic.php?id=93016

BOOKMARK_DB=${HOME}/.bm.db
NAME=bm

bm()
{
    local special='=';
    local add='+';
    local remove='-';

    ## end easy edit.
    local unsafe="s/'/''/g" # the sed clean up replacement
    local arg1="$(echo "$1" | sed "${unsafe} " )" # a copy of $1 that's safe to work with
    local arg2="$(echo "$2" | sed "${unsafe} " )" # a copy of $2 that's safe to work with
    local dinit=0; # are we doing the database init before anything else?

    ## Check the database for errors, if there is an error we force init.
    echo ".schema bookmarks;" | sqlite3 "$BOOKMARK_DB" || {
        echo "Database cannot be checked." >&2
        echo "Recreating database, your bookmarks will be lost :("
        dinit=1;
    }

    if [[ "$dinit" = "1" || "$arg1" = "${special}init" ]]; then
        rm "$BOOKMARK_DB"
        echo "CREATE TABLE bookmarks(bookmark text primary key, path text);" |
            sqlite3 "${BOOKMARK_DB}" || {
                echo "ERROR: UNABLE TO CREATE DATABASE '${BOOKMARK_DB}'"
                return 101
            }
        echo "Database created."
        [[ $dinit = 0 ]] && return 0; # quit early if all we're doing is initing.
    fi

    # normal argument scanner:
    case $arg1 in
    ${special}l|${special}list)
        echo "SELECT bookmark FROM bookmarks;" |
            sqlite3 "${BOOKMARK_DB}" ;;
    ${special}h|${special}help|${special}\?)
        echo "USAGE: $NAME ARGUMENT
Where argument is either a bookmark to CD to or beginning with a special character:
${special}
    Operates all special commands such as 'help', 'init', 'query' and 'list'
${add}
    Adds a new bookmark, optional second argument for path.
${remove}
    Removes the bookmark specified.

Example usage:
Force creation of a new database
(should be done automatically on first run).
    \$ $NAME ${special}init
Add the bookmark 'b' to the directory 'bar'
    \$ $NAME ${add}b bar
Add the bookmark 't' to /tmp
    \$ $NAME ${add}t /tmp
List all bookmarks
    \$ $NAME ${special}l
Query the path 't' points to
    \$ $NAME ${special}q t
Remove the bookmark 't'
    \$ $NAME ${remove}t

Special files:
${BOOKMARK_DB}
    The bookmark database." ;;
    ${special}q|${special}query)
        [ -z $2 ] && {
            echo "You must specify a bookmark to query." >&2
            return 22
        }
        echo "SELECT path FROM bookmarks WHERE bookmark='${arg2}';" |
            sqlite3 "${BOOKMARK_DB}" ;;
    $special*)
        echo "Unrecognised command." >&2
        return 21
        ;;
    $add*)
        arg1="${arg1:1}"
        if [[ "${arg1:0:1}" = "$add" || "${arg1:0:1}" = "$special" || "${arg1:0:1}" = "$remove" ]]; then
            echo "Error, bookmark name begins with a special character." >&2
            return 12;
        else
            if [ -z "$2" ]; then
                arg2="$(pwd | sed "${unsafe} " )"
            elif [ ! -d "$2" ]; then
                echo "Path invalid." >&2
                return 11
            fi
            echo "INSERT OR REPLACE INTO bookmarks VALUES('${arg1}','${arg2}');" |
                sqlite3 "${BOOKMARK_DB}"
        fi ;;
    $remove*)
        arg1="${arg1:1}"
        echo $( echo "PRAGMA count_changes = true; DELETE FROM bookmarks WHERE bookmarks.bookmark='${arg1}';" |
            sqlite3 "${BOOKMARK_DB}" ) "result(s) deleted." ;;

    *)
        local path="$(echo "SELECT path FROM bookmarks WHERE bookmark='${arg1}';" |
            sqlite3 "${BOOKMARK_DB}")" #"
        if [ -z "${path}" ]; then
            echo "Bookmark doesn't exist.
Are you looking for help? Consult '$NAME =help'" >&2
            return 2
        elif [ -d "${path}" ]; then
            cd "${path}"
        else
            echo "Bad path ${path}" >&2
            return 1
        fi
        ;;
    esac
}
