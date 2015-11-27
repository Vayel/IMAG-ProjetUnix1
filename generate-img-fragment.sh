#!/bin/sh

src=$1
url=$2
name=$3
date=$4
width=$5
height=$6

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
