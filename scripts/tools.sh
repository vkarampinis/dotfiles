#!/bin/sh
TOOLS="_tools.txt"
SCRIPTPATH="$( cd "$(dirname "$0")" ; pwd -P )"

sed 's/[[:space:]]*#.*//;/^[[:space:]]*$/d' $SCRIPTPATH/$TOOLS | while read line; do
  if test ! $(which $line)
    then
      echo "Installing $line..."
      brew install $line
  fi
done
