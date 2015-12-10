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
  local exif=`get_exif "$path"`
  local dt=`date_from_exif "$exif"`
  local w=`width_from_exif "$exif"`
  local h=`height_from_exif "$exif"`

  . ./generate-img-fragment.sh "$src" "$url" "$name" $dt $w $h >> $index
}

display_image "$@"
