#!/bin/sh

HERE=$(cd "$(dirname "$0")" && pwd)

. "$HERE"/utilities.sh

. "$HERE"/get-args.sh "$@"

index_path="$dest/$index"
thumb_dirname=thumbnails
dest_thumbs="$dest/$thumb_dirname"

create_dir "$dest_thumbs"
create_html_file "$index_path"

html_head "TP Unix - galerie HTML" > "$index_path"

n=`count_images "$src"`
paths=("$src"/*.jpg)

for ((i = 0; i < $n; i++)); do # Use indexes because of whitespaces
  path=${paths[$i]}
  fname=`get_fname "$path"`
  name=`get_name "$path"`
  
  url="$name.html"
  prev=`get_prev_page "$src" $i $n`
  next=`get_next_page "$src" $i $n`

  "$HERE"/create-image.sh "$path" "$dest_thumbs" $force $verb
  "$HERE"/generate-img-page.sh "$dest" "$fname" "$index" "$prev" "$next"
  "$HERE"/display-image.sh "$dest_thumbs/$fname" "$thumb_dirname/$fname" "$url" >> "$index_path"
done

html_tail >> "$index_path"
