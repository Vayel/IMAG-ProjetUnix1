#!/bin/sh

DIR=$(cd "$(dirname "$0")" && pwd)

. ./utilities.sh

. ./get-args.sh "$@"
index_path="$dest/$index"
dest_thumbnails="$dest/thumbnails"

create_dir "$dest_thumbnails"
create_html_file $index_path

html_head "TP Unix - galerie HTML" > $index_path

n=`find_images $src | wc -l`
i=0

for path in `find_images $src`; do
  fname=`get_fname $path`
  name=`get_name $path`
  url="$i.html"
  prev=`expr $i + $n - 1`; prev=`expr $prev % $n` # -1 % n = -1 != n-1
  next=`expr $i + 1`; next=`expr $next % $n`

  . ./create-image.sh $path $dest_thumbnails $force $verb
  . ./generate-img-page.sh "$name" "$fname" "$dest/$url" "$index" "$prev.html" "$next.html"
  . ./display-image.sh "$dest_thumbnails/$fname" "thumbnails/$fname" $index_path $url

  i=`expr $i + 1`
done

html_tail >> $index_path
