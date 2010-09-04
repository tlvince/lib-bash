##
# Generic configuration file subroutines.
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
# Exhaustively look for a config file in expected paths, otherwise exit.
#
# @param $1 string  The application name.
#
getConfig()
{
    local config="${XDG_CONFIG_HOME:-"$HOME/.config"}/$1"

    if [[ -f "$config/$1.conf" ]]; then
        config="$config/$1.conf"
    elif [[ -f "/etc/$1.conf" ]]; then
        config="/etc/$1.conf"
    else
        echo "error: unable to determine $1.conf location" >&2
        exit 1
    fi

    echo "$config"
}
