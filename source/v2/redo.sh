#!/bin/sh

build() {

    filename=$(basename $1 .dhall)

    rm -f $filename.md $filename.html
    cat shortcodes.dhall $filename.dhall | premd-exe > $filename.md
    # each template requires 5 parameters.
    # $1 is the base file,
    # $2-$4 are the padding,
    # $5 is the text alignment
    pandoc --variable padding="$2 $3 $4" \
           --variable alignment=$5 \
           --template template.htmk \
           -s -o $filename.html $filename.md
    rm -f $filename.md
}

rebuild | awk '/^lessons-/ { print "let " $1 " = \"" $3 "\""}' > courseList.dhall
cat courseListPre.dhall >> courseList.dhall

build index.dhall 100px 10% 100px center
build about.dhall 100px 1% 100px left
build goals.dhall 100px 0 50px left
build team.dhall 100px 0 100px center
build course-descriptions.dhall 100px 4% 100px left
build course-list.dhall 100px 0 100px center
build school-list.dhall 100px 10% 100px left
build participating-schools.dhall 100px 10% 100px left
build pathways.dhall 100px 4% 100px left
build coming-soon.dhall 100px 5% 100px center
build contact.dhall 100px 0 100px center
build teacher-login.dhall 100px 0 100px center
build newsletters.dhall 100px 10% 100px center
build announcements.dhall 100px 10% 100px center
