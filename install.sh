#!/usr/bin/env bash

install_scripts () {
  for file in $1/*; do

    # skip this script and the man pages
    if [ $file == "$1/install.sh" ] || [ $file == "$1/Man" ]; then
      echo skipping $file
      continue

    # recursively add files in folders
    elif [ -d $file ]; then
      echo entering directory $file
      install_scripts $file

    # hard link each script to usr bin
    elif [ -f $file ]; then
      echo attempting to install $file
      ln $file /usr/bin/$(basename $file)

    fi
  done
}

install_man_pages () {
  for file in ./Man/*; do
    filename="${file##*/}"

    # skip the new man page creator script
    if [ $filename == "newPage.py" ]; then
      continue

    # install man page
    else
      install -g 0 -o 0 -m 0644 $file /usr/local/man/man1
      gzip /usr/local/man/man1/$filename
    fi
  done
  mandb
}

install_scripts $(pwd)
install_man_pages
