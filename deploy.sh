#!/bin/sh

ROOTDIR=${ROOTDIR:-${HOME}}

cd $(dirname $0)

rm -rf html
echo Sync static/ html/
rsync -aSH static/ html/

build() {
    cd source/$1
    sh ./redo.sh
    cp *.html ../../html/
    cd ../..
}

# build v1
build v2

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
