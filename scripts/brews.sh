#!/bin/sh
TOOLS="_brews.txt"
SCRIPTPATH="$( cd "$(dirname "$0")" ; pwd -P )"

. scripts/_utils.sh

brew upgrade

echo "Check brews to install..."
INSTALLED_BREWS=(`brew list -1`)
sed 's/[[:space:]]*#.*//;/^[[:space:]]*$/d' $SCRIPTPATH/$TOOLS | while read brew; do
  if [ ! $(contains "${INSTALLED_BREWS[@]}" "$brew") == "y" ]; then
    echo "Install $brew"
    brew install $brew
  fi
done

echo "Brew cleanup..."
brew cleanup
