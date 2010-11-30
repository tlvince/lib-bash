# In-line spellchecker
sp()
{
    local words
    which "aspell" > /dev/null 2>&1 || exit 1

    words=$(aspell -a < <(echo $@) | grep -v "^@(#)")   # grep header
    [[ $words == "*" ]] && return   # correct spelling

    sed -e 's/.*:\ //' < <(echo $words) # rid of the crap
}
