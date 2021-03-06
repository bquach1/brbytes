#!/bin/sh

build() {

    filename=$(basename $1 .dhall)

    rm -f $filename.md $filename.html
    cat shortcodes.dhall $filename.dhall | premd-exe > $filename.md
    pandoc --template template.htmk -s -o $filename.html $filename.md

}

build index.dhall

