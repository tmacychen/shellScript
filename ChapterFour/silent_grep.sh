#!/bin/bash

if test $# -ne 2
then
    echo "Error !Please input like :$0 match_text filename"
fi

match_text=$1
filename=$2

grep -q $match_text $filename

if test $? -eq 0
then
    echo "The text exists in the file"
else
    echo "The text does not exists in the file"
fi
