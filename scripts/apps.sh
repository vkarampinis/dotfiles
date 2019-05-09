#!/bin/sh
TOOLS="_apps.txt"
SCRIPTPATH="$( cd "$(dirname "$0")" ; pwd -P )"

. scripts/_utils.sh

echo "Check apps to install..."

sed 's/[[:space:]]*#.*//;/^[[:space:]]*$/d' $SCRIPTPATH/$TOOLS | while read app; do
  KEY="${app%%::*}"
  VALUE="${app##*::}"

  if ! mas list | grep $KEY &> /dev/null; then
    echo "Install $VALUE"
    mas install $KEY
  fi
done

echo "Upgrade packages..."
mas upgrade
