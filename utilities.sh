#!/bin/sh

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

find_images () {
  find "$1" -maxdepth 1 -name "*.jpg" -printf "%f\n" -o -name "*.jpeg" -printf "%f\n"
}

verbose () {
  if [ "$1" = "true" ]; then
    echo "$2"
  fi
}
