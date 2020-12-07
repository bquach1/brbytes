#!/bin/sh

cd $(dirname $0)

mv     $HOME/html/courses $HOME/html.courses
rm -rf $HOME/html
mkdir  $HOME/html
mv     $HOME/html.courses $HOME/html/courses

rsync -vaSH html/ $HOME/html/
