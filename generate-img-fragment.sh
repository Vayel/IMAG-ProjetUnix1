#!/bin/sh

echo "<figure>";

if [ "$3" != "" ]; then
  echo "<a href=\"$3\" title=\"$2\">";
fi

echo "<img src=\"$1\" alt=\"$2\" />";

if [ "$3" != "" ]; then
  echo "</a>";
fi

echo "<figcaption>$2</figcaption>";
echo "</figure>";
