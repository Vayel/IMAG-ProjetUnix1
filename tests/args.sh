#! /bin/sh

HERE=$(cd "$(dirname "$0")" && pwd)
PATH="$HERE/..:$PATH"

init () {
  rm -fr source dest
  mkdir -p source dest
  make-img.sh source/image1.jpg
}

check () {
  if [ ! -f "$1" ]
  then
      echo "ERROR: $1 was not generated"
  fi
}

init
galerie-shell.sh --source source --dest dest
check "dest/index.html"

init
galerie-shell.sh -s source -d dest
check "dest/index.html"

init
galerie-shell.sh -s source -d dest --index indexxx.html
check "dest/indexxx.html"

init
galerie-shell.sh -s source -d dest -i indexxx.html
check "dest/indexxx.html"

init
galerie-shell.sh -s source -d dest -f -v
check "dest/index.html"

init
galerie-shell.sh -s source -d dest --force --verb
check "dest/index.html"
