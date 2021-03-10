#!/bin/sh

set -e

DYN=../dynamic

mkdir -p $DYN ../html

build() {
    echo build "$@"
    pathname=$(dirname $1)
    filename=$(basename $1 .dhall)
    htmlname=$(basename $(basename $filename .md) .html)

    if [ "x$6" = "x" ]; then
        titleopt=""
    else
        titleopt="--metadata title=\"$6\""
    fi

    case $filename in

        *.md)
            cat etc/shortcodes.dhall \
                $1 | \
                premd-exe > $DYN/$filename

            # each template requires 5 parameters.
            # $1 is the base file,
            # $2-$4 are the padding,
            # $5 is the text alignment
            echo pandoc -o ../html/$htmlname.html $DYN/$filename
            pandoc --variable padding="$2 $3 $4" \
                   --variable alignment=$5 \
                   --variable dispatch='$dispatch' \
                   $titleopt \
                   --template $DYN/template.html \
                   -s -o ../html/$htmlname.html $DYN/$filename
            #rm -f $DYN/$filename
            ;;

        *.html)
            export T_PADDING="$2 $3 $4"
            export T_ALIGNMENT="$5"
            echo "premd-exec $1 > ../html/$htmlname.html"
            cat etc/shortcodes.dhall \
                $1 \
                template.direct.dhall \
                | premd-exe \
                      > ../html/$htmlname.html
            ;;

        *)
            echo Not processing $filename
            ;;

    esac

    echo ""
}

cat template.pandoc.html.dhall | premd-exe > $DYN/template.html

rebuild | \
  awk '/^lessons-/ { print "let " $1 " = \"" $3 "\""}' \
  > $DYN/courseList.dhall

cat etc/courseListPre.dhall >> $DYN/courseList.dhall

build index.md.dhall                       100px 10% 100px center
build teachers.md.dhall                    100px  0  100px center
build students.html.dhall                  100px  0  100px center
build students-fallback.md.dhall           100px  0  100px center
build students-wait.html.dhall             100px 20% 100px center
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
