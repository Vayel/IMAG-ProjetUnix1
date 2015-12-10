#!/bin/sh

DIR=$(cd "$(dirname "$0")" && pwd)

. ./utilities.sh
. ./generate-img-fragment.sh

display_image () {
  local fname=$1; shift
  local dest=$1; shift
  local index=$1; shift
  local name=$1; shift
  local url=$1

  local thumbnail_src="$THUMBNAIL_DIRNAME/$fname"

  # EXIF data
  local exif=`./exiftags -a $dest/$fname`
  local dt=`echo "$exif" | grep "Image Created:" | sed "s/Image Created: \(.*\)/\1/"`
  local w=`echo "$exif" | grep "Image Width:" | grep -Po "[0-9]+"`
  local h=`echo "$exif" | grep "Image Height:" | grep -Po "[0-9]+"`

  generate_img_fragment "$thumbnail_src" "$url" "$name" "$dt" $w $h >> $index
}
