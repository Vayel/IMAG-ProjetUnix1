#!/bin/sh

DIR=$(cd "$(dirname "$0")" && pwd)

. ./utilities.sh

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

generate_img_page () {
  local name=$1; shift
  local src=$1; shift
  local path=$1; shift
  local index=$1; shift
  local prev=$1; shift
  local next=$1

  create_html_file $path

  html_head $name > $path
  header $name $index $prev $next >> $path
  img $src $name >> $path
  html_tail >> $path
}
