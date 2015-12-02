#!/bin/sh

DIR=$(cd "$(dirname "$0")" && pwd)

. ./utilities.sh
. ./create-image.sh
. ./display-image.sh
. ./generate-img-page.sh
. ./get-args.sh

get_args "$@"
index_path="$dest/$index"
dest_thumbnails="$dest/thumbnails"

create_dir $dest_thumbnails
create_html_file $index_path

html_head "TP Unix - galerie HTML" > $index_path

n=`find_images $src | wc -l`
i=0

for fname in `find_images $src`; do
  name=`get_fname $fname`
  url="$i.html"
  prev=`expr $i + $n - 1`; prev=`expr $prev % $n` # -1 % n = -1 != n-1
  next=`expr $i + 1`; next=`expr $next % $n`

  create_image $src $fname $dest $dest_thumbnails $force $verb

  generate_img_page "$name" "$fname" "$dest/$url" "$index" "$prev.html" "$next.html"
  display_image $fname $dest $index_path $name $url

  i=`expr $i + 1`
done

html_tail >> $index_path
