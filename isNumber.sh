#
# Check if an argument is a number.
#
# Adapted from: http://pbrisbin.com:8080/
#
# return 1  Argument is not a number.
#
# isNumber()
# {
    # if [[ "${1//[0-9]/}" ]]; then
        # return 1
    # fi
# }

# [[ $(isNumber $1) || $? != 0 ]] && criticalError

#
# Throw an error if an argument is not a number.
#
# param $1  The argument to check.
#
isNumber()
{
    if [[ -n "${1//[0-9]/}" ]]; then
        echo "$1 is not a number" 1>&2
        exit 1
    fi
}
