#!/bin/sh

DIR=$(cd "$(dirname "$0")" && pwd)

dest=$1
index_path=$2

for fname in `ls $dest | grep "jpg\|jpeg" | grep -v "thumbnail."`; do
  thFname="thumbnail.$fname"
  . ./generate-img-fragment.sh $thFname $fname $fname >> $index_path
done
