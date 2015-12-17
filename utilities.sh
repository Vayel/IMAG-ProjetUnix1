#!/bin/sh

HERE=$(cd "$(dirname "$0")" && pwd)

html_head() {
  echo "<!DOCTYPE html>"
  echo "<html>"
  echo "<head>"
  echo "<title>$1</title>"
  echo '<meta charset="utf-8" />'
  echo "<style>"
  echo "body {"
  echo "text-align: center;"
  echo "}"
  echo "figure {"
  echo "display: inline-block;"
  echo "vertical-align: top;"
  echo "}"
  echo "</style>"
  echo "</head>"
  echo "<body>"
}

html_tail() {
  echo "</body>"
  echo "</html>"
}

html_title() {
  echo "<h1>$1</h1>"
}

create_dir () {
  if [ ! -d "$1" ]; then
    mkdir -p "$1"
  fi
}

create_html_file () {
  if [ -f "$1" ]; then
    read -p "The file $1 already exists. Do you want to overwrite it? [Y/n]" yn
    if [ "$yn" == "n" -o "$yn" == "N" ]; then
      exit
    fi
  fi

  touch "$1"
}

find_images () {
  find "$1" -maxdepth 1 -name "*.jpg"
}

verbose () {
  if [ "$1" = "true" ]; then
    echo "$2"
  fi
}

get_name () {
  fname=`get_fname "$1"`
  echo "${fname%.*}"
}

get_fname () {
  path=$1
  echo "${path##*/}"
}

get_dir () {
  path=$1
  echo "${path%/*}"
}

get_exif () {
  "$HERE"/exiftags -a "$1"
}

date_from_exif () {
  echo "$1" | grep "Image Created:" | sed "s/Image Created: \(.*\)/\1/"
}

width_from_exif () {
  echo "$1" | grep "Image Width:" | grep -Po "[0-9]+"
}

height_from_exif () {
  echo "$1" | grep "Image Height:" | grep -Po "[0-9]+"
}

get_prev_page () {
  local paths=("$1"/*.jpg)
  local i=$2
  local n=$3

  prev=`expr $i + $n - 1` # -1 % n = -1 != n-1
  prev=`expr $prev % $n`
  prev=${paths[$prev]}
  prev=`get_name "$prev"`
  echo "$prev.html"
}

get_next_page () {
  local paths=("$1"/*.jpg)
  local i=$2
  local n=$3

  next=`expr $i + 1`
  next=`expr $next % $n`
  next=${paths[$next]}
  next=`get_name "$next"`
  echo "$next.html"
}

count_images () {
  find_images "$1" | wc -l
}
