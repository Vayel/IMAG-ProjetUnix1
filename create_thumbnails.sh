#!/bin/sh

DIR=$(cd "$(dirname "$0")" && pwd)
WIDTH=200
HEIGHT=200

src=$1
dest=$2
pattern=$3
force=$4
verb=$5

for fname in `ls $src | grep $pattern`; do
  src_path="$src/$fname"
  dest_path="$dest/$fname"
  dest_path_mini="$dest/thumbnails/$fname"
  
  if [ "$force" = "true" -o ! -f $dest_path_mini ]; then
    if [ "$verb" = "true" ]; then
      echo "Creating thumbnail for $src_path..."
    fi
    convert -resize "$WIDTHx$HEIGHT" $src_path $dest_path_mini

    if [ "$verb" = "true" ]; then
      echo "Copying $src_path into $dest..."
    fi
    cp $src_path $dest_path
  fi
done
