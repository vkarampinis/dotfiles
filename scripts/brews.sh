#!/bin/sh
TOOLS="_brews.txt"
SCRIPTPATH="$( cd "$(dirname "$0")" ; pwd -P )"
BREW_PREFIX=$(brew --prefix)

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

# Switch to using brew-installed bash as default shell
if ! fgrep -q "${BREW_PREFIX}/bin/bash" /etc/shells; then
  echo "${BREW_PREFIX}/bin/bash" | sudo tee -a /etc/shells;
  chsh -s "${BREW_PREFIX}/bin/bash";
fi;

echo "Brew cleanup..."
brew cleanup
