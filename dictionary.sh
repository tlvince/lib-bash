# Dictionary
# From: http://www.64bitjungle.com/linux/some-really-useful-linux-command-line-tricks/
dict()
{
    curl -s dict://dict.org/d:$1 | grep -v '^2[0,2,5]'
}
