#!/bin/sh

DYN=../html

mkdir -p $DYN

build() {
    echo build "$@"
    pathname=$(dirname $1)
    filename=$(basename $(basename $1 .dhall) .html)

    cat etc/shortcodes.dhall \
        $1 | \
        premd-exe > $DYN/$filename.md

    # each template requires 5 parameters.
    # $1 is the base file,
    # $2-$4 are the padding,
    # $5 is the text alignment
    pandoc --variable padding="$2 $3 $4" \
           --variable alignment=$5 \
           --template template.html \
           -s -o $DYN/$filename.html $DYN/$filename.md
    rm -f $DYN/$filename.md
}

cat template.html.dhall | premd-exe > template.html

rebuild ./rebuild.conf | \
  awk '/^lessons-/ { print "let " $1 " = \"" $3 "\""}' > courseList.dhall

cat etc/courseListPre.dhall >> courseList.dhall

build index.html.dhall                  100px 10% 100px center
build teachers.dhall                    100px  0  100px center
build students.dhall                    100px  0  100px center
build parents/pathways.dhall            100px  4% 100px left
build parents/course-descriptions.dhall 100px  4% 100px left
build news/newsletters.dhall            100px 10% 100px center
build news/announcements.dhall          100px 10% 100px center
build about/overview.dhall              100px  1% 100px left
build about/goals.dhall                 100px  0   50px left
build about/contact.dhall               100px  0  100px center

#build coming-soon.dhall                 100px  5% 100px center
#build participating-schools.dhall       100px 10% 100px left
#build school-list.dhall                 100px 10% 100px left
#build team.dhall                        100px  0  100px center

rm -f template.html courseList.dhall
