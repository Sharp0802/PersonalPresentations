#!/bin/sh

pre=$pwd
cd $(dirname $(readlink -f $0))

rm -rf build
cd post

set -- $(find -name '*.md')
while [ $# -gt 0 ]; do
    fname="$1"
    fname="${fname%.*}.pdf"
    marp $1 --html --pdf --allow-local-files --output "../build/$fname"
shift; done

cd $pre
