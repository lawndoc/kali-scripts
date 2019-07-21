#!/usr/bin/env bash

install_from () {
  for file in $1/*; do

    # recursively add files in folders
    if [ -d $file ]; then
      install_from $file

    # skip this script
    elif [ $file == "$1/install.sh" ]; then
      continue

    # hard link each script to usr bin
    elif [ -f $file ]; then
      ln $file /usr/bin/$(basename $file)

    fi
  done
}

install_from $(pwd)
