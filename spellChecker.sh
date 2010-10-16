# Spellchecker
# From: http://www.joegrossberg.com/archives/000080.html
sp()
{
    echo $@ | aspell -a | grep -v "^@(#)"
}
