#
# Get SVN revision data from a file.
# This method accommodates multi-project respositories.
#
# TODO: have a case switch to get specific details
#
# param $1  The full path to the file under SVN.
#
svnRevision()
{
    # REGEX patterns:
    _URL='s/URL:\ //g'      # Remove "URL: "
    _UTC='s/\ .*//g'        # Date in "YYYY-MM-DD" format
    _UTC_TIME='s/\ +.*//g'  # Date and time in "YYYY-MM-DD HH:MM:SS" format
    _LCD='s/^.*Date:\ //g'  # Filter "Last Changed Date: " string

    SVN_URL=$(svn info "$1" | grep '^URL:' | sed "$_URL")
    SVN_REVISION=$(svn log "$SVN_URL" | grep ^r[0-9] | wc -l)
    # SVN_DATE=$(svn info "$SVN_URL" | grep Date: | sed -e "$_LCD" -e "$_UTC_TIME")
}
