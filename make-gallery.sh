#!/bin/sh

HERE=$(cd "$(dirname "$0")" && pwd)

. "$HERE"/utilities.sh

create_dir "$2"

n=`count_images "$1"`
paths=("$1"/*.jpg)

for ((i = 0; i < $n; i++)); do # Use indexes because of whitespaces
  path=${paths[$i]}
  "$HERE"/create-image.sh "$path" "$2" "$3" "$4"
done
