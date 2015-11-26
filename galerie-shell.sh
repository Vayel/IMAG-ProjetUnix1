#!/bin/sh

DIR=$(cd "$(dirname "$0")" && pwd)

. ./utilities.sh

. ./get_args.sh

index_path="$dest/$index"
thumbnails_dir="$dest/thumbnails"
if [ ! -d thumbnails_dir ]; then
  mkdir thumbnails_dir 
fi

. ./create_thumbnails.sh $src $dest $force $verb
. ./create_html_file.sh $index_path

html_head "TP Unix - galerie HTML" > $index_path
. ./display_images.sh $dest $index_path
html_tail >> $index_path
