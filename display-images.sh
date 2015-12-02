#!/bin/sh

DIR=$(cd "$(dirname "$0")" && pwd)

. ./utilities.sh
. ./generate-img-page.sh
. ./generate-img-fragment.sh

display_images () {
  local dest=$1; shift
  local index_name=$1

  local index_path="$dest/$index_name"
  local n=`find_images $dest | wc -l`
  local i=0

  echo "$n"

  for fname in `find_images $dest`; do
    # Create page for fullsized image
    local name=`echo "$fname" | sed "s/\(.*\)$pattern/\1/"`
    local prev=`expr $i + $n - 1` # Because -1 % n = -1 != n-1
    local prev=`expr $prev % $n`
    local next=`expr $i + 1`
    local next=`expr $next % $n`
    local url="$i.html"

    generate_img_page "$name" "$fname" "$dest/$url" "$index_name" "$prev.html" "$next.html"

    local i=`expr $i + 1`

    # Add thumbnail to gallery
    local th_fname="thumbnails/$fname"

    local exif=`./exiftags -a $dest/$fname`
    local date=`echo "$exif" | grep "Image Created:" | sed "s/Image Created: \(.*\)/\1/"`
    local width=`echo "$exif" | grep "Image Width:" | grep -Po "[0-9]+"`
    local height=`echo "$exif" | grep "Image Height:" | grep -Po "[0-9]+"`

    if [ -f "$dest/$th_fname" ]; then
      generate_img_fragment "$th_fname" $url "$name" "$date" $width $height >> $index_path
    fi
  done
}
