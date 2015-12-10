#!/bin/sh

DIR=$(cd "$(dirname "$0")" && pwd)

. ./utilities.sh

i=0
paths=($1)
n=`echo "${paths[@]}" | wc -w`
echo "$n"

for path in ${paths[@]}; do
  fname=`get_fname $path`
  name=`get_name $path`
  url="$name.html"
  prev=`get_prev_page $i ${paths[@]}`
  next=`get_next_page $i $n ${paths[@]}`

  . ./generate-img-page.sh "$2" "$fname" "$3" "$prev" "$next"

  i=`expr $i + 1`
done
