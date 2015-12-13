#!/bin/sh

HERE=$(cd "$(dirname "$0")" && pwd)

. "$HERE"/utilities.sh

header () {
  echo "<header>"
  html_title "$1"
  echo "<nav>"
  echo "<a href=\"$2\">Home</a>"
  echo "<a href=\"$3\">Previous</a>"
  echo "<a href=\"$4\">Next</a>"
  echo "</nav>"
  echo "</header>"
}

img () {
  echo "<img src=\"$1\" alt=\"$2\" />"
}

dir=$1; shift
fname=$1; shift
index=$1; shift
prev=$1; shift
next=$1

name=`get_name "$fname"`
page_path="$dir/$name.html"

create_html_file "$page_path"

html_head "$name" > "$page_path"
header "$name" "$index" "$prev" "$next" >> "$page_path"
img "$fname" "$name" >> "$page_path"
html_tail >> "$page_path"
