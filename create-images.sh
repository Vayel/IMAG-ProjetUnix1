#!/bin/sh

DIR=$(cd "$(dirname "$0")" && pwd)

create_images () {
  local WIDTH=200
  local HEIGHT=200

  local src=$1
  local dest=$2
  local pattern=$3
  local force=$4
  local verb=$5

  for fname in `ls $src | grep $pattern`; do
    local src_path="$src/$fname"
    local dest_path="$dest/$fname"
    local dest_path_mini="$dest/thumbnails/$fname"
    
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
}
