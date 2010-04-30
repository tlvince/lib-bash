# Title:    random-generator.sh
# Author:   Tom Vincent
# Created:  0.1.0 (2009-06-04)
# Updated:  0.1.1 (2010-04-20)
#
# Generate a random string. Using 'urandom' so suitable for passwords
#
# TODO:
# * Use args to specify string length (instead of fixed at 10)

randomString()
{
    # No special characters
    cat /dev/urandom | tr -dc "a-zA-Z0-9" | fold -w 10 | head -n 1
}
#head -c 500 /dev/urandom | tr -dc "a-z0-9A-Z" | fold -w 10 | head -n 1      # alt.

# Special characters

#cat /dev/urandom | tr -dc "a-zA-Z0-9-_!@#$%^&*()_+{}|:<>?=" | fold -w 10 | head -n 1
