#!/bin/sh

src=$1; shift
url=$1; shift
name=$1; shift
date=$1; shift
width=$1; shift
height=$1

echo "<figure>"
  echo "<a href=\"$url\" title=\"$name\">"
  echo "<img src=\"$src\" alt=\"$name\" />"
  echo "</a>"

  echo "<figcaption>"
    echo "<b>Name:</b> $name"

    echo "<br/><b>Date:</b> "
    if [ "$date" != "" ]; then
      echo "$date"
    else
      echo "unknown"
    fi

    echo "<br/><b>Size:</b> "
    if [ "$width" != "" -a "$height" != "" ]; then
      echo "${width}x${height}"
    else
      echo "unknown"
    fi
  echo "</figcaption>"
echo "</figure>"
