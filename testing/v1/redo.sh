#!/bin/sh

if [ x$1 = x ]; then
    echo "Usage: $0 filename.dhall"
    exit 0
fi

filename=$(basename $1 .dhall)

if [ -z "$filename" ]; then exit 0 ; fi

rm -f $filename.md $filename.html
cat shortcodes.dhall $filename.dhall | premd-exe > $filename.md
pandoc --template template.htmk -s -o $filename.html $filename.md

