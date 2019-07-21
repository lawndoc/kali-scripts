#!/usr/bin/env bash

for file in .; do
  if [ $file -eq "install.sh" ]; then
    continue
  fi
  ln $(pwd)/$file /usr/bin/$file
done
