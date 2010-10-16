# In-line spellchecker
sp()
{
    aspell -a < <(echo $@) | grep -v "^@(#)"
}
