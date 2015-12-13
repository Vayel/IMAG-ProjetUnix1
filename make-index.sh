#!/bin/sh

HERE=$(cd "$(dirname "$0")" && pwd)

. "$HERE"/utilities.sh

html_head "TP Unix - galerie HTML"

for fname in $1; do
  cat "$fname"
done

html_tail
