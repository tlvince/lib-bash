#
# Capitalise the first letter of a string.
# From: https://www.linuxquestions.org/questions/programming-9/bash-change-first-character-to-upper-case-570445/
#
capitaliseFirst()
{
    string0="$@"
    firstchar=${string0:0:1}
    string1=${string0:1}
    FirstChar=`echo "$firstchar" | tr a-z A-Z`
    echo "$FirstChar$string1"
}
