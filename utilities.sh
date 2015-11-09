#!/bin/sh

html_head() {
  echo "<!DOCTYPE html>";
  echo "<html>";
  echo "<head>";
  echo "<title>$1</title>";
  echo '<meta charset="utf-8" />';
  echo "</head>";
  echo "<body>";
}

html_tail() {
  echo "</body>";
  echo "</html>";
}

html_title() {
  echo "<h1>$1</h1>";
}
