##
# From the given regex ($1), find the relevant mpd.conf parameter.
#
# e.g.:
#   mpdParam '^music_directory'
#
# Dependencies:
#   * locateMPDConf
mpdParam()
{
    if [[ -z "$1" ]]; then
        echo "mpdParam called without a parameter" >&2
        exit 1
    fi

    local paramDir="$(awk "/$1/ {print \$2}" $(locateMPDConf))"

    paramDir="${paramDir//\"/}"       # Strip quotes
    paramDir="${paramDir/\~/$HOME}"   # Fix ~

    echo $paramDir
}
