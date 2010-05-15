##
# Library functions related to notifications.
#
# Author:  Tom Vincent
# Created: 2010-05-15
#

##
# Get the preferred notification daemon.
#
getNotifier()
{
    local notifier="echo"

    if [[ "$DBUS_SESSION_BUS_ADDRESS" ]]; then
        notifier="notify-send"
    fi

    echo $notifier
}
