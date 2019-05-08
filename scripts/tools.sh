#!/bin/sh
TOOLS="_tools.txt"
INSTALLED_BREWS=(`brew list -1`)
SCRIPTPATH="$( cd "$(dirname "$0")" ; pwd -P )"

. scripts/_utils.sh

brew upgrade

sed 's/[[:space:]]*#.*//;/^[[:space:]]*$/d' $SCRIPTPATH/$TOOLS | while read brew; do
  if [ ! $(contains "${INSTALLED_BREWS[@]}" "$brew") == "y" ]; then
    echo "Install $brew"
    brew install $brew
  fi
done
