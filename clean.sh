#!/bin/sh

read -p "Are you sure to delete all files in $1? [Y/n]" yn
if [ "$yn" != "n" -a "$yn" != "N" ]; then
  find "$1" -mindepth 1 -delete
fi
