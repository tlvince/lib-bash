#
# Common error API.
#


#
# Output a critical error message and exit the program abruptly.
#
# param $1  The error's name (as listed in API), otherwise output a generic
#           error message.
#
# TODO:
# * API for case arguments
#
criticalError()
{
    echo -e "There has been a critical error:\n"
    echo -n "    "
    if [[ $# -gt 0 ]]; then

        case $1 in
            notFound)
                echo "Cannot access $2: no such file or directory"
            ;;
            *)
                echo "There is a problem with $1."
            ;;
        esac

    else
        echo "The error is unspecified."
    fi

    echo
    echo "${NAME:-"Script"} will exit abruptly." 1>&2
    exit 1
}

#
# Output a warning error message.
#
# These errors are non-critical and intended to provide feedback to the user.
#
warningError()
{
    echo -n "Warning: "
    if [[ $# -gt 0 ]]; then

        case $1 in
            empty)
                echo "Directory $2 is empty."
            ;;
            notFound)
                echo "Cannot access $2: no such file or directory"
            ;;
            *)
                echo "There is a problem with $1."
            ;;
        esac

    else
        echo "The error is unspecified."
    fi
}
