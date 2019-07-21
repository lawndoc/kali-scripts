#!/usr/bin/env bash

for file in *; do
  if [ $file == "install.sh" ]; then
    continue
  fi
  ln $(pwd)/$file /usr/bin/$file
done
