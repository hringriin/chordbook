#!/bin/bash

LILYPONDSRC=../src/*/lilypond/

for var in ${LILYPONDSRC[@]} ; do
    make -C $var
done
