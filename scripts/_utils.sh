#!/bin/sh

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
