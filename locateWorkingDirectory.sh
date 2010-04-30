#
# Filter the results of `locate` to the current working directory.
#
# Note: this would be better suited as an alias, however, we need to handle
#       parameters.
#
# param $@  The file(s) to find.
search()
{
    locate "$@" | grep $(pwd)
}
