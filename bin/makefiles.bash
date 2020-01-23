#!/bin/bash

tmpMakefile=../Templates/Makefile
MakefilePath=../src/*/lilypond/

for var in ${MakefilePath[@]} ; do
    cp -v ${tmpMakefile} ${var}
    sed -i "s/<FILENAME>/$(echo ${var} | awk -F/ '{print $(NF-2)}')/g" ${var}/Makefile
done

unset tmpMakefile
unset MakefilePath
