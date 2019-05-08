#!/bin/sh
TOOLS="_tools.txt"
SCRIPTPATH="$( cd "$(dirname "$0")" ; pwd -P )"

install_brews() {
  if test ! $(brew list | grep $brew); then
    echo "Installing $brew"
    brew install $brew >/dev/null
    echo "✓ installed!\n"
  else
    echo "$brew already installed. Skipped."
  fi
}

sed 's/[[:space:]]*#.*//;/^[[:space:]]*$/d' $SCRIPTPATH/$TOOLS | while read brew; do
    install_brews $brew
done
