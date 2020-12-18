#!/bin/sh

build() {

    filename=$(basename $1 .dhall)

    rm -f $filename.md $filename.html
    cat shortcodes.dhall $filename.dhall | premd-exe > $filename.md
    pandoc --variable format=$2  --template template.htmk -s -o $filename.html $filename.md
    rm -f $filename.md
}

build landing.dhall 1
build about.dhall 2
build about2.dhall 3
build team.dhall 4
build course-descriptions.dhall 5
build course-list.dhall 6
build school-list.dhall 7
build pathways.dhall 8
