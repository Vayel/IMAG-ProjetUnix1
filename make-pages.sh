#!/bin/sh

HERE=$(cd "$(dirname "$0")" && pwd)

. "$HERE"/utilities.sh

src=$1; shift
dest=$1; shift
index=$1

n=`count_images "$src"`
paths=("$src"/*.jpg)

for ((i = 0; i < $n; i++)); do # Use indexes because of whitespaces
  path=${paths[$i]}
  fname=`get_fname "$path"`
  name=`get_name "$path"`

  url="$name.html"
  prev=`get_prev_page "$src" $i`
  next=`get_next_page "$src" $i $n`

  "$HERE"/generate-img-page.sh "$dest" "$fname" "$index" "$prev" "$next"
done
