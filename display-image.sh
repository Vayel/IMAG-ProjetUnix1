#!/bin/sh

DIR=$(cd "$(dirname "$0")" && pwd)

. ./utilities.sh

display_image () {
  local path=$1; shift
  local src=$1; shift
  local index=$1; shift
  local url=$1

  local fname=`get_fname $path`
  local name=`get_name $path`

  # EXIF data
  local exif=`./exiftags -a $path`
  local dt=`echo "$exif" | grep "Image Created:" | sed "s/Image Created: \(.*\)/\1/"`
  local w=`echo "$exif" | grep "Image Width:" | grep -Po "[0-9]+"`
  local h=`echo "$exif" | grep "Image Height:" | grep -Po "[0-9]+"`

  . ./generate-img-fragment.sh "$src" "$url" "$name" "$dt" $w $h >> $index
}

display_image "$@"
