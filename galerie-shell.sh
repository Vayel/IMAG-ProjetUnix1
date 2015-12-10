#!/bin/sh

DIR=$(cd "$(dirname "$0")" && pwd)

. ./utilities.sh

. ./get-args.sh "$@"
index_path="$dest/$index"
dest_thumbnails="$dest/thumbnails"

create_dir "$dest_thumbnails"
create_html_file $index_path

html_head "TP Unix - galerie HTML" > $index_path

i=0
n=`find_images $src | wc -l`
paths=(`find_images $src`)

for path in ${paths[@]}; do
  fname=`get_fname $path`
  name=`get_name $path`
  
  url="$name.html"
  prev=`get_prev_page $i ${paths[@]}`
  next=`get_next_page $i $n ${paths[@]}`

  . ./create-image.sh $path $dest_thumbnails $force $verb
  . ./generate-img-page.sh "$dest" "$fname" "$index" "$prev" "$next"
  . ./display-image.sh "$dest_thumbnails/$fname" "thumbnails/$fname" $index_path $url

  i=`expr $i + 1`
done

html_tail >> $index_path
