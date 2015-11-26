#!/bin/sh

DIR=$(cd "$(dirname "$0")" && pwd)

. ./utilities.sh

. ./get_args.sh
# . ./create_thumbnails.sh

index_path="$dest/$index"

. ./create_html_file.sh $index_path

html_head "TP Unix - galerie HTML" > $index_path
. ./display_images.sh $dest $index_path
html_tail >> $index_path

cat $index_path # TODO
# ls $dest # TODO
