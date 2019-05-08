#!/bin/sh

CASKS_TO_CHECK="_cask.txt"
SCRIPTPATH="$( cd "$(dirname "$0")" ; pwd -P )"

. scripts/_utils.sh

brew cask upgrade

echo "Check casks to install..."
INSTALLED_CASKS=(`brew cask list -1`)
sed 's/[[:space:]]*#.*//;/^[[:space:]]*$/d' $SCRIPTPATH/$CASKS_TO_CHECK | while read cask; do
  if [ ! $(contains "${INSTALLED_CASKS[@]}" "$cask") == "y" ]; then
    echo "Installing $cask..."
    brew cask install $cask
  fi
done
