#!/bin/sh

DIR=$(cd "$(dirname "$0")" && pwd)

. ./utilities.sh

create_image () {
  local WIDTH=200
  local HEIGHT=200

  local src_path=$1; shift
  local dest_thumbnails=$1; shift
  local force=$1; shift
  local verb=$1

  local src_dir=`get_dir $src_path`
  local fname=`get_fname $src_path`
  local dest_dir="$dest_thumbnails/.."
  local dest_path="$dest_dir/$fname"
  local dest_path_thumbnail="$dest_thumbnails/$fname"

  if [ "$force" = "true" -o ! -f $dest_path_thumbnail ]; then
    verbose $verb "Creating thumbnail for $src_path..."
    convert -resize "$WIDTHx$HEIGHT" $src_path $dest_path_thumbnail

    verbose $verb "Copying $src_path into $dest_dir..."
    cp $src_path $dest_path
  fi
}
