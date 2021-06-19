#!/bin/sh

set -e

DYN=../dynamic
REBUILDALL=no

mkdir -p $DYN ../html

build() {
    REBUILD=$REBUILDALL

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
        #export T_PADDING="$2 $3 $4"
        export T_PADDING="0 $3 0"
        export T_ALIGNMENT="$5"
        export T_DISPATCH='$dispatch'
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
                pandoc --variable padding="${T_PADDING}" \
                       --variable alignment="${T_ALIGNMENT}" \
                       --variable dispatch="${T_DISPATCH}" \
                       $titleopt \
                       --template $DYN/template.html \
                       -s -o $outfile $DYN/$filename
                #rm -f $DYN/$filename
                ;;

            *.html)
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

buildir() {
    REBUILD=no

    fullname=$1/$2
    pathname=$(dirname $fullname)
    filename=$(basename $fullname .dhall)
    htmlname=$(basename $(basename $filename .md) .html)
    outfile=../html/$1/$htmlname.html

    mkdir -p ../html/$1

    if [ -f $outfile ]; then
        if [ $1/template.html.dhall -nt $outfile ]; then REBUILD=yes
        elif [ $fullname -nt $outfile ]; then REBUILD=yes
        elif [ etc/shortcodes.dhall -nt $outfile ]; then REBUILD=yes
        fi
    else
        REBUILD=yes
    fi

    if [ $REBUILD = yes ]; then
        echo "Building $fullname"
        cat etc/shortcodes.dhall \
            $fullname \
            $1/template.html.dhall \
            | premd-exe > $outfile
    else
        echo "Skipping $fullname"
    fi
}

if [ -f $DYN/template.html \
        -a $DYN/template.html -nt template.html.dhall \
   ]; then
    echo "Skipping rebuild template"
else
    REBUILDALL=yes
    echo "Rebuilding template"

    export T_PADDING='$padding$'
    export T_ALIGNMENT='$alignment$'
    export T_DISPATCH='$dispatch$'
    cat tpandoc.dhall template.html.dhall | \
        premd-exe > $DYN/template.html
fi

if false ; then
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
fi

build index.md.dhall                       100px 10% 100px center
build teachers.md.dhall                    100px  0  100px center
build schools.html.dhall                     100px 10%  100px left
build students.html.dhall                  100px  0  100px center
#build students-fallback.md.dhall           100px  0  100px center
build students-wait.html.dhall             100px 20% 100px center
build parents/pathways.md.dhall            100px  4% 100px left
build parents/careers.md.dhall             100px  4% 100px left
build parents/course-descriptions.md.dhall 100px  4% 100px left
build news/newsletters.md.dhall            100px 10% 100px center
build news/announcements.md.dhall          100px 10% 100px center
build about/overview.md.dhall              100px  1% 100px left
build about/participating.md.dhall         100px  4% 100px left
build about/goals.md.dhall                 100px  0   50px left
build about/bios.md.dhall                  100px  0  100px center
build about/contact.md.dhall               100px  0  100px center

build pdf2html/nlLatest.html.dhall                    100px  0  100px center

buildir caincenter sti-confirmation.html.dhall

#build coming-soon.dhall                 100px  5% 100px center
#build participating-schools.dhall       100px 10% 100px left
#build school-list.dhall                 100px 10% 100px left
#build team.dhall                        100px  0  100px center
