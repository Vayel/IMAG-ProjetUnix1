#! /bin/sh

HERE=$(cd "$(dirname "$0")" && pwd)
PATH="$HERE/..:$PATH"

rm -fr "sourc e" "des t"
mkdir -p "sourc e" "des t"

make-img.sh "sourc e"/image1.jpg
make-img.sh "sourc e"/image2.jpg
make-img.sh "sourc e"/image3.jpg

galerie-shell.sh --source "sourc e" --dest "des t"

if [ -f "des t"/index.html ]
then
    echo "Now run 'firefox des t/index.html' to check the result"
else
    echo "ERROR: des t/index.html was not generated"
fi
