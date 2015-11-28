#!/bin/sh

DIR=$(cd "$(dirname "$0")" && pwd)

. ./utilities.sh
. ./create-images.sh
. ./create-html-file.sh
. ./display-images.sh
. ./get-args.sh

get_args "$@"
index_path="$dest/$index"
thumbnails_dir="$dest/thumbnails"
ext_pattern="\.jpe*g$"

create_dir $thumbnails_dir
create_images $src $dest $ext_pattern $force $verb
create_html_file $index_path

html_head "TP Unix - galerie HTML" > $index_path
display_images $dest $index $ext_pattern
html_tail >> $index_path
