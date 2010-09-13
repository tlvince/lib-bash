##
# Functions relating to variable setting.
#
# Copyright 2010 Tom Vincent <http://www.tlvince.com/>
#
# This program is free software: you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation, either version 3 of the License, or
# (at your option) any later version.
#
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the
# GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public License
# along with this program. If not, see <http://www.gnu.org/licenses/>.


##
# Return 1 if $1 is not set, otherwise 0.
#
# @param $1 string  The name of a variable (excluding leading dollar).
#
isSet()
{
    [[ ${!1} ]]
}


##
# If the given variable is not set, recursively prompt to set it.
#
# @param $1 string  The name of a variable (excluding leading dollar).
# @param $2 string  An optional prompt to set $1.
#
isSetPrompt()
{
    [[ $2 ]] || set "$1" "Please set $1: "

    isSet "$1"
    [[ $? != 0 ]] && {
        read -p "$2" $1
        isSetPrompt "$@"
    }
}
