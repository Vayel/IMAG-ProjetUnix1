#!/bin/sh

HERE=$(cd "$(dirname "$0")" && pwd)

. "$HERE"/utilities.sh

WIDTH=200
HEIGHT=200

src_path=$1; shift
dest_thumbs=$1; shift
force=$1; shift
verb=$1

src_dir=`get_dir "$src_path"`
fname=`get_fname "$src_path"`
dest_dir="$dest_thumbs/.."
dest_path="$dest_dir/$fname"
dest_path_thumb="$dest_thumbs/$fname"

if [ "$force" = "true" -o ! -f "$dest_path_thumb" ]; then
  verbose $verb "Creating thumbnail for $src_path..."
  convert -resize "$WIDTHx$HEIGHT" "$src_path" "$dest_path_thumb"

  verbose $verb "Copying $src_path into $dest_dir..."
  cp "$src_path" "$dest_path"
fi
