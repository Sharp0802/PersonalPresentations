#!/bin/sh

cd post
set -- $(find -name '*.md')
while [ $# -gt 0 ]; do
    fname="$1"
    fname="${fname%.*}.html"
    marp $1 --html --output "../build/$fname"
shift; done
cd ..