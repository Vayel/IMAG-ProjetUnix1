#!/bin/sh

HERE=$(cd "$(dirname "$0")" && pwd)

. "$HERE"/utilities.sh

path=$1; shift
src=$1; shift
url=$1

fname=`get_fname "$path"`
name=`get_name "$path"`

# EXIF data
exif=`get_exif "$path"`
dt=`date_from_exif "$exif"`
w=`width_from_exif "$exif"`
h=`height_from_exif "$exif"`

"$HERE"/generate-img-fragment.sh "$src" "$url" "$name" "$dt" "$w" "$h"
