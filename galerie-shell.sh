#!/bin/sh

DIR=$(cd "$(dirname "$0")" && pwd)

. ./utilities.sh
. ./create-image.sh
. ./create-html-file.sh
. ./display-images.sh
. ./get-args.sh

get_args "$@"
index_path="$dest/$index"
dest_thumbnails="$dest/thumbnails"

create_dir $dest_thumbnails
create_html_file $index_path

html_head "TP Unix - galerie HTML" > $index_path

for fname in `find_images $src`; do
  create_image $src $fname $dest $dest_thumbnails $force $verb
done
display_images $dest $index

html_tail >> $index_path
