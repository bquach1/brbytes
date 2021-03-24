#!/bin/sh

set -e

DYN=../dynamic
REBUILD=no

mkdir -p $DYN ../html

build() {
    pathname=$(dirname $1)
    filename=$(basename $1 .dhall)
    htmlname=$(basename $(basename $filename .md) .html)
    outfile=../html/$htmlname.html

    if [ "x$6" = "x" ]; then
        titleopt=""
    else
        titleopt="--metadata title=\"$6\""
    fi

    if [ -f $outfile ]; then
        if [ $1 -nt $outfile ]; then REBUILD=yes ; fi
        if [ etc/shortcodes.dhall -nt $outfile ]; then REBUILD=yes ; fi
    else
        REBUILD=yes
    fi

    if [ $REBUILD = no ]; then
        echo "Not rebuilding $1"
    else
        echo Building $outfile # "$@"
        case $filename in

            *.md)
                cat etc/shortcodes.dhall \
                    $1 | \
                    premd-exe > $DYN/$filename

                # each template requires 5 parameters.
                # $1 is the base file,
                # $2-$4 are the padding,
                # $5 is the text alignment
                #echo pandoc -o $outfile $DYN/$filename
                pandoc --variable padding="$2 $3 $4" \
                       --variable alignment=$5 \
                       --variable dispatch='$dispatch' \
                       $titleopt \
                       --template $DYN/template.html \
                       -s -o $outfile $DYN/$filename
                #rm -f $DYN/$filename
                ;;

            *.html)
                export T_PADDING="$2 $3 $4"
                export T_ALIGNMENT="$5"
                export T_DISPATCH='$dispatch'
                #echo "premd-exec $1 > $outfile"
                cat etc/shortcodes.dhall \
                    $1 \
                    template.html.dhall \
                    | premd-exe \
                          > $outfile
                ;;

            *)
                echo Not processing $filename
                ;;

        esac
    fi
}

if [ -f $DYN/template.html \
        -a $DYN/template.html -nt template.html.dhall \
   ]; then
    echo "Skipping rebuild template"
else
    REBUILD=yes
    echo "Rebuilding template"

    export T_PADDING='$padding$'
    export T_ALIGNMENT='$alignment$'
    export T_DISPATCH='$dispatch$'
    cat tpandoc.dhall template.html.dhall | \
        premd-exe > $DYN/template.html
fi

if [ -f $DYN/courseList.dhall \
        -a $DYN/courseList.dhall -nt etc/courseListPre.dhall \
   ]; then
    echo "Skipping rebuild courseList"
else
    echo "Rebuilding courseList"
    rebuild | \
        awk '/^lessons-/ { print "let " $1 " = \"" $3 "\""}' \
            > $DYN/courseList.dhall
    cat etc/courseListPre.dhall >> $DYN/courseList.dhall
fi

build index.md.dhall                       100px 10% 100px center
build teachers.md.dhall                    100px  0  100px center
build schools.html.dhall                     100px 10%  100px left
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

#build nl2103.html.dhall                    100px  0  100px center

#build coming-soon.dhall                 100px  5% 100px center
#build participating-schools.dhall       100px 10% 100px left
#build school-list.dhall                 100px 10% 100px left
#build team.dhall                        100px  0  100px center
