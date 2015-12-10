#!/bin/sh

DIR=$(cd "$(dirname "$0")" && pwd)

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
    mkdir "$1"
  fi
}

create_html_file () {
  if [ -f $1 ]; then
    read -p "The file $1 already exists. Do you want to overwrite it? [Y/n]" yn
    if [ "$yn" == "n" -o "$yn" == "N" ]; then
      exit
    fi
  fi

  touch $1
}

find_images () {
  find "$1" -maxdepth 1 -name "*.jpg" -o -name "*.jpeg"
}

verbose () {
  if [ "$1" = "true" ]; then
    echo "$2"
  fi
}

get_name () {
  fname=`get_fname $1`
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
  ./exiftags -a $1
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
