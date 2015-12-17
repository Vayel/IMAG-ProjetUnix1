#!/bin/sh

HERE=$(cd "$(dirname "$0")" && pwd)

. "$HERE"/utilities.sh

name=$1; shift
src=$1; shift
thumb_dir=$1
path="$src/$name"

"$HERE"/create-image.sh "$path" "$thumb_dir" false false
