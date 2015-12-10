#!/bin/sh

DIR=$(cd "$(dirname "$0")" && pwd)

. ./utilities.sh

create_dir "$2"

for path in $1; do
  ./create-image.sh "$path" $2 $3 $4
done
