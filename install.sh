#!/usr/bin/env bash

install_scripts () {
  for file in $1/*; do

    # skip this script and the man pages
    if [ $file == "$1/install.sh" ] || [ $file == "$1/Man" ]; then
      continue

    # recursively add files in folders
    elif [ -d $file ]; then
      install_scripts $file

    # hard link each script to usr bin
    elif [ -f $file ]; then
      ln $file /usr/bin/$(basename $file)

    fi
  done
}

install_man_pages () {
  for file in Man/*; do

    # skip the new man page creator script
    if [ $file == "newPage.py" ]; then
      continue

    # install man page
    else
      install -g 0 -o 0 -m 0644 $file.1 /usr/local/man/man1
      gzip /usr/local/man1/$file.1
    fi
  done
}

install_scripts $(pwd)
install_man_pages
