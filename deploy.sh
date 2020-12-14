#!/bin/sh

ROOTDIR=${ROOTDIR:-${HOME}}

mv     $ROOTDIR/html/courses $ROOTDIR/html.courses
rm -rf $ROOTDIR/html
mkdir  $ROOTDIR/html
mv     $ROOTDIR/html.courses $ROOTDIR/html/courses

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

build v1
build v2

echo Sync html/ $ROOTDIR/html/
rsync -aSH html/ $ROOTDIR/html/
