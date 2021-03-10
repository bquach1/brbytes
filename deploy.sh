#!/bin/sh

ROOTDIR=${ROOTDIR:-${HOME}}
ASSETS=../website-assets

cd $(dirname $0)

if [ ! -d $ASSETS ]; then
    echo "Please install website-assets"
    exit 1
fi

rm -rf html
echo Sync static/ html/
rsync -aSH static/ html/

build() {
    cd source
    sh ./redo.sh
    cd ..
}

build

if [ -d $ROOTDIR/html.courses ]; then
    echo Previous build did not finish properly
    exit 1
fi

mkdir -p $ROOTDIR/html/courses
mv     $ROOTDIR/html/courses $ROOTDIR/html.courses
rm -rf $ROOTDIR/html
mkdir  $ROOTDIR/html

echo Sync html/ $ROOTDIR/html/
rsync -aSH html/ $ROOTDIR/html/

mv     $ROOTDIR/html.courses $ROOTDIR/html/courses

cd $ASSETS
sh deploy.sh
