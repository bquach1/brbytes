#!/bin/sh

filename=$(basename $1 .dhall)

cat shortcodes.dhall $filename.dhall | premd-exe > $filename.md
pandoc --template template.htmk -s -o $filename.html $filename.md

