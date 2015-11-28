#!/bin/sh

DIR=$(cd "$(dirname "$0")" && pwd)

. ./utilities.sh
. ./create-html-file.sh

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
  local img_name=$1
  local img_src=$2
  local fpath=$3
  local index_path=$4
  local prev=$5
  local next=$6

  create_html_file $fpath

  html_head $img_name > $fpath
  header $img_name $index_path $prev $next >> $fpath
  img $img_src $img_name >> $fpath
  html_tail >> $fpath
}
