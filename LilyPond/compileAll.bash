#!/bin/bash
# compileAll

if [[ $1 == "" ]] ; then
    echo "No Parameter given. Aborting!"
    exit 1

fi

SRCMKFILES='../src/*/lilypond/'

function compile()
{
    for var in ${SRCMKFILES[@]}
    do
        make -C ${var}
    done
}

function purge()
{
    for var in ${SRCMKFILES[@]}
    do
        make -C ${var} purgeALL
    done
}

if [[ $1 == "compile" ]] ; then
    compile
elif [[ $1 == "purge" ]] ; then
    purge
else
    echo "Wrong Parameter given. Aborting!"
    exit 2
fi
