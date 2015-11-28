#!/bin/sh

DIR=$(cd "$(dirname "$0")" && pwd)

create_html_file () {
  if [ -f $1 ]; then
    read -p "The file $1 already exists. Do you want to overwrite it? [Y/n]" yn
    if [ "$yn" == "n" -o "$yn" == "N" ]; then
      exit
    fi
  fi

  touch $1
}
