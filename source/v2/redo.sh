#!/bin/sh

build() {

    filename=$(basename $1 .dhall)

    rm -f $filename.md $filename.html
    cat shortcodes.dhall $filename.dhall | premd-exe > $filename.md
    pandoc --variable padding=$2 --variable alignment=$3  --template template.htmk -s -o $filename.html $filename.md
    rm -f $filename.md
}

build landing.dhall "100px 10%" "center"
build about.dhall "100px 1%" "left"
build about2.dhall "100px 0 50px 0" "left"
build team.dhall "100px 0 100px 0" "center"
build course-descriptions.dhall "100px 4%" "left"
build course-list.dhall "100px 0" "center"
build school-list.dhall "100px 10%" "left"
build pathways.dhall "100px 4%" "left"
