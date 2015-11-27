#!/bin/sh

DIR=$(cd "$(dirname "$0")" && pwd)

dest=$1
index_path=$2
pattern=$3

for fname in `ls $dest | grep $pattern`; do
  th_fname="thumbnails/$fname"
  name=`echo "$fname" | sed "s/\(.*\)$pattern/\1/"`

  exif=`./exiftags -a $dest/$fname`
  date=`echo "$exif" | grep "Image Created:" | sed "s/Image Created: \(.*\)/\1/"`
  width=`echo "$exif" | grep "Image Width:" | grep -Po "[0-9]+"`
  height=`echo "$exif" | grep "Image Height:" | grep -Po "[0-9]+"`

  if [ -f "$dest/$th_fname" ]; then
    . ./generate-img-fragment.sh "$th_fname" "$fname" "$name" "$date" $width $height >> $index_path
  fi
done
