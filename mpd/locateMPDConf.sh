##
# Return the mpd.conf passed as a parameter to mpd or an expected default
#
locateMPDConf()
{
    # Don't use any command that overrides the "real" mpd binary
    local config="$(pgrep -fl $(which --skip-tilde mpd) | awk '{print $3}')"

    if [[ -z $config ]]; then
        if [[ -f "$HOME/.mpd/mpd.conf" ]]; then
            config="$HOME/.mpd/mpd.conf"
        elif [[ -f "/etc/mpd.conf" ]]; then
            config="/etc/mpd.conf"
        else
            echo "unable to determine mpd.conf location" >&2
            exit 1
        fi
    fi

    echo $config
}
