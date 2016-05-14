#!/bin/bash

#################################################################################
# Title     :   Add Leadsheets/Chords/Texts/... to Setlist                      #
# Author    :   Joschka Koester                                                 #
#               E-Mail (work): jkoester@tzi.de                                  #
#               E-Mail (priv): koester.joschka@gmail.com                        #
# Date      :   2014-03-13                                                      #
# Version   :   v1.0-4                                                          #
# Requires  :   dialog                                                          #
# Category  :   Shell menu tools                                                #
#################################################################################
# Description:                                                                  #
#   This Script creates a LaTeX-File with the specified name. Additionally      #
#   it fills the file with the following content:                               #
#       - \section{@title}                                                      #
#       - \subsection{Text}                                                     #
#       - [\includepdf | \include | \input] -link to the text                   #
#       - \subsection{Noten, Leadsheets, \ldots}                                #
#       - \includepdf to the notes, leadsheets, ...                             #
# Note:                                                                         #
#   - ...                                                                       #
#################################################################################

# Variables for title, backtitle and version
version="v1.0-4"
dialogtitle="Add to Setlist $version"
backtitle="Linux Shell Script - by hringriin"
PN=`basename "$0"`

# The variable for the outputfile $file
file="./addToSetlist.txt"

# Getting stdrr working with this script
_tmp1="/tmp/tmp1.$$"
_tmp2="/tmp/tmp2.$$"
dialog 2>$_tmp1
#dialog 2>$_tmp2
DVER=`cat $_tmp1 | head -1`

# The shitty esc key
esc="Do not press the shitty [ESC] key!"



# Yes or No?
dialog --title "$dialogtitle" --backtitle "$backtitle" --yesno "Do you want to add a song to Setlist?" 0 0

# get response
response=$?



case $response in
    0)

    dialog --title "$dialogtitle" \
        --backtitle "$backtitle" \
        --checklist "Tag item(s) to choose. \n\nMove using [UP], [DOWN], [SPACE] to select and [ENTER] to confirm your choice!" 0 0 0 \
            10 "Create Lyrics entry in LaTeX file" off \
            20 "Create Leadsheet entry in LaTeX file" off \
            30 "Create Chored Lyrics  entry in LaTeX file" on 2>$_tmp1

    sh -c "cp $_tmp1 $_tmp2"

    dialog --backtitle "$backtitle" \
        --form "Fill in the form for the name of the Artist, the Title and the Prefix of the song.\n
The Prefix is meant to be the filename without any ending, 'mad_world' for example." 0 0 0 \
        "Artist" 2 4 "" 2 20 40 0 \
        "Title" 4 4 "" 4 20 40 0 \
        "Index" 6 4 "" 6 20 40 0 \
        "File prefix" 8 4 "" 8 20 40 0 \
        2>$_tmp1

    # Iterator
    i=0

    while read line
    do
        area[i]="$line"
        i=`expr $i+1`
    done <$_tmp1

    artist="${area[0]}"
    title="${area[1]}"
    index="${area[2]}"
    prefix="${area[3]}"

    tex="$prefix.tex"
    file="$prefix.pdf"

    sh -c "touch $tex"

#    echo -e "\section{$artist -- $title}">>$tex
#    echo -e "   \subsection{Text}">>$tex

    e=$(grep -c "10" "$_tmp2")
        if [ $e -gt 0 ]; then
            echo -e "       \includepdf[pages=-,scale=0.8]{input/Texte/$file}">>$tex
#        else
#            echo -e "       %\includepdf[pages=-,scale=0.8]{input/Texte/$file}">>$tex
        fi
#    echo -e "   \subsection{Noten, Leadsheets, \ldots}">>$tex

    e=$(grep -c "20" "$_tmp2")
        if [ $e -gt 0 ]; then
            echo -e "       \includepdf[pages=-,scale=0.8]{input/Noten/$file}">>$tex
#        else
#            echo -e "       %\includepdf[pages=-,scale=0.8]{input/Noten/$file}">>$tex
        fi

    e=$(grep -c "30" "$_tmp2")
        if [ $e -gt 0 ]; then
            echo -e "\\\stepcounter{subsection}\n">>$tex
            echo -e "\\\beginsong{$title}[%">>$tex
            echo -e "    by={$artist},">>$tex
            echo -e "    index={$index}]\n">>$tex
            echo -e "    \\\phantomsection">>$tex
            echo -e "    \\\addcontentsline{toc}{subsection}{\\\thesubsection \\\quad \\\textbf{$title} --- $artist}\n">>$tex
            echo -e "    \\\label{$index}\n">>$tex
            echo -e "    \\\beginverse">>$tex
            echo -e "        Example verse ...">>$tex
            echo -e "    \\\endverse">>$tex
            echo -e "\\\endsong">>$tex
        fi


    ;;
    1) echo "No file has been touched!";;
    255) echo "$esc";;
esac


rm $_tmp1
rm $_tmp2
