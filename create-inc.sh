#!/bin/sh

DIR=$(cd "$(dirname "$0")" && pwd)

. ./utilities.sh

name=`get_name "$1"`
exif=`get_exif "$2/$name.jpg"`
dt=`date_from_exif "$exif"`
w=`width_from_exif "$exif"`
h=`height_from_exif "$exif"`

./generate-img-fragment.sh "$3/$name.jpg" "$name.jpg" "$name" "$dt" "$w" "$h"
