#!/bin/sh

DIR=$(cd "$(dirname "$0")" && pwd)

dest=$1
index_path=$2

for fname in `ls $dest | grep "jpg\|jpeg"`; do
  th_fname="thumbnails/$fname"
  . ./generate-img-fragment.sh $th_fname $fname $fname >> $index_path
done
