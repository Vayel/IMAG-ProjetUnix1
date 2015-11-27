#!/bin/sh

DIR=$(cd "$(dirname "$0")" && pwd)

dest=$1
index_path=$2
pattern=$3

for fname in `ls $dest | grep $pattern`; do
  th_fname="thumbnails/$fname"

  if [ -f "$dest/$th_fname" ]; then
    . ./generate-img-fragment.sh $th_fname $fname $fname >> $index_path
  fi
done
