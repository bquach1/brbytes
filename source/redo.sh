#!/bin/sh

DYN=../html

mkdir -p $DYN

build() {
    echo build "$@"
    pathname=$(dirname $1)
    filename=$(basename $1 .dhall)
    htmlname=$(basename $(basename $1 .md) .html)

    cat etc/shortcodes.dhall \
        $1 | \
        premd-exe > $DYN/$filename

    # each template requires 5 parameters.
    # $1 is the base file,
    # $2-$4 are the padding,
    # $5 is the text alignment
    pandoc --variable padding="$2 $3 $4" \
           --variable alignment=$5 \
           --variable dispatch='$dispatch' \
           --template template.html \
           -s -o $DYN/$htmlname.html $DYN/$filename
    rm -f $DYN/$filename
}

cat template.html.dhall | premd-exe > template.html

rebuild ./rebuild.conf | \
  awk '/^lessons-/ { print "let " $1 " = \"" $3 "\""}' > courseList.dhall

cat etc/courseListPre.dhall >> courseList.dhall

build index.md.dhall                       100px 10% 100px center
build teachers.md.dhall                    100px  0  100px center
build students.html.dhall                  100px  0  100px center
build parents/pathways.md.dhall            100px  4% 100px left
build parents/course-descriptions.md.dhall 100px  4% 100px left
build news/newsletters.md.dhall            100px 10% 100px center
build news/announcements.md.dhall          100px 10% 100px center
build about/overview.md.dhall              100px  1% 100px left
build about/goals.md.dhall                 100px  0   50px left
build about/contact.md.dhall               100px  0  100px center

#build coming-soon.dhall                 100px  5% 100px center
#build participating-schools.dhall       100px 10% 100px left
#build school-list.dhall                 100px 10% 100px left
#build team.dhall                        100px  0  100px center

rm -f template.html courseList.dhall
