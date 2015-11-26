#!/bin/sh

DIR=$(cd "$(dirname "$0")" && pwd)
WIDTH=200
HEIGHT=200

src=$1
dest=$2
force=$3
verb=$4

for fname in `ls $src | grep "jpg\|jpeg"`; do
  srcPath="$src/$fname"
  destPath="$dest/$fname"
  destPathMini="$dest/thumbnail.$fname"
  
  if [ "$force" = "true" -o ! -f $destPathMini ]; then
    if [ "$verb" = "true" ]; then
      echo "Creating thumbnail for $srcPath..."
    fi
    convert -resize "$WIDTHx$HEIGHT" $srcPath $destPathMini

    if [ "$verb" = "true" ]; then
      echo "Copying $srcPath into $dest..."
    fi
    cp $srcPath $destPath
  fi
done
