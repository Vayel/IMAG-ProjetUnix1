#! /bin/sh

HERE=$(cd "$(dirname "$0")" && pwd)
PATH="$HERE/..:$PATH"

rm -fr source dest
mkdir -p source dest

make-img.sh source/image1.jpg
make-img.sh source/image2.jpg

galerie-shell.sh --source source --dest dest --index indexxx.html

if [ -f dest/indexxx.html ]
then
    echo "Now run 'firefox dest/indexxx.html' to check the result"
else
    echo "ERROR: dest/indexxx.html was not generated"
fi
