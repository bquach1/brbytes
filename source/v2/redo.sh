#!/bin/sh

build() {

    filename=$(basename $1 .dhall)

    rm -f $filename.md $filename.html
    cat shortcodes.dhall $filename.dhall | premd-exe > $filename.md
    # each template requires 5 parameters. $1 is the base file, $2-$4 are the padding, $5 is the text alignment
    # 6th parameter is optional. it is used to specify the file wants to use the teacher-login template
    if $6
    then pandoc --variable padding="$2 $3 $4" --variable alignment=$5 --variable default=true --template template.htmk -s -o $filename.html $filename.md
    else
    pandoc --variable padding="$2 $3 $4" --variable alignment=$5 --template template.htmk -s -o $filename.html $filename.md
    fi
    rm -f $filename.md
}

build landing.dhall 100px 10% 100px center true
build about.dhall 100px 1% 100px left
build about2.dhall 100px 0 50px left
build team.dhall 100px 0 100px center
build course-descriptions.dhall 100px 4% 100px left
build course-list.dhall 100px 0 100px center
build school-list.dhall 100px 10% 100px left
build pathways.dhall 100px 4% 100px left
build teacher-login.dhall 100px 2% 100px center false
