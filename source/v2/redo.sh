#!/bin/sh

build() {

    filename=$(basename $1 .dhall)

    rm -f $filename.md $filename.html
    cat shortcodes.dhall $filename.dhall | premd-exe > $filename.md
    pandoc --template template.htmk -s -o $filename.html $filename.md
    rm -f $filename.md
}

build landing.dhall
build about.dhall
build about2.dhall
build team.dhall
build course-descriptions.dhall
build course-list.dhall
build school-list.dhall
build pathways.dhall
