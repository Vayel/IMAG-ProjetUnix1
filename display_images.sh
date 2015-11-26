#!/bin/sh

DIR=$(cd "$(dirname "$0")" && pwd)

dest=$1
index_path=$2

for fname in `ls $dest | grep "jpg\|jpeg"`; do
  . ./generate-img-fragment.sh $fname $fname $fname >> $index_path
done
