#!/bin/sh

generate_img_fragment () {
  local src=$1; shift
  local url=$1; shift
  local name=$1; shift
  local date=$1; shift
  local width=$1; shift
  local height=$1

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
}
