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
  local page_path=$1; shift
  local index=$1; shift
  local prev=$1; shift
  local next=$1

  create_html_file $page_path

  html_head $name > $page_path
  header $name $index $prev $next >> $page_path
  img $src $name >> $page_path
  html_tail >> $page_path
}

generate_img_page "$@"
