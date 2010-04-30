#
# Output a information error message.
#
# These errors are non-critical and intended to provide feedback to the user.
#
printInformation()
{
    echo -n "Information: "
    if [[ $# -gt 0 ]]; then

        case $1 in
            empty)
                echo "File or directory $2 is empty."
            ;;
            delete)
                echo "Deleted $2"
            ;;
            *)
                echo "There is a problem with $1"
            ;;
        esac

    else
        echo "The error is unspecified."
    fi
}
