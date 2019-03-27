#!/bin/sh
TOOLS="_tools.txt"
SCRIPTPATH="$( cd "$(dirname "$0")" ; pwd -P )"

while IFS= read -r var
do
    if test ! $(which $var)
        then
        echo "Installing $var..."
        brew install $var
    fi
done < "$SCRIPTPATH/$TOOLS"

