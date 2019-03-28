#!/bin/sh

INSTALLED_CASKS=(`brew cask list -1`)
CASKS_TO_CHECK="_cask.txt"
SCRIPTPATH="$( cd "$(dirname "$0")" ; pwd -P )"

function contains() {
  local n=$#
  local value=${!n}
    for ((i=1;i < $#;i++)) {
      if [ "${!i}" == "${value}" ]; then
        echo "y"
        return 0
      fi
    }
  echo "n"
  return 1
}

sed 's/[[:space:]]*#.*//;/^[[:space:]]*$/d' $SCRIPTPATH/$CASKS_TO_CHECK | while read line; do
  if [ ! $(contains "${INSTALLED_CASKS[@]}" "$line") == "y" ]; then
    echo "Installing $line..."
    brew cask install $line
  fi
done
