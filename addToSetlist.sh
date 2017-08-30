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
version="v2.0-0"
dialogtitle="Add to Setlist $version"
backtitle="Linux Shell Script - by hringriin"
PN=`basename "$0"`

# The variable for the outputfile $file
file="./addToSetlist.txt"

# Getting stdrr working with this script
_tmp1="/tmp/tmp1.$$"
_tmp2="/tmp/tmp2.$$"
_tmp3="/tmp/tmp3.$$"
_tmp4="/tmp/tmp4.$$"
dialog 2>$_tmp1
#dialog 2>$_tmp2
DVER=`cat $_tmp1 | head -1`

# The shitty esc key
esc="Do not press the shitty [ESC] key!"



function legacy()
{
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
            "Artist" 2 4 "" 2 20 80 0 \
            "Title" 4 4 "" 4 20 80 0 \
            "Index" 6 4 "" 6 20 80 0 \
            "Copyright" 8 4 "" 8 20 80 0 \
            "License" 10 4 "" 10 20 80 0 \
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
        copyright="${area[3]}"
        license="${area[4]}"


        tex="$index.tex"
        file="$index.pdf"

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
                echo -e "    cr={$copyright},">>$tex
                echo -e "    li={$license},">>$tex
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
}

function checkLegacy()
{
    # Yes or No?
    dialog --title "$dialogtitle" --backtitle "$backtitle" --defaultno --yesno "Do you want the legacy version of this script?" 0 0

    # get response
    response=$?

    case $response in
        0)
            dialog --msgbox "Alright, legacy version. Proceed at your own risk!" 0 0 ;
            legacy
            ;;
        1)
            addSong
            ;;
        255) echo "$esc";;
    esac
}

function main()
{
    checkLegacy
    cleanup
}

function addSong()
{
    # Yes or No?
    dialog --title "$dialogtitle" --backtitle "$backtitle" --yesno "Do you want to add a song to Setlist?" 0 0

    # get response
    response=$?

    case $response in
        0)
            dialog --backtitle "$backtitle" \
                --form "Fill in the form according to the labels. The filename has to be conform to the follow regular expression: [A-Za-z0-9_-]*[A-Za-z0-9_-]. The filename will also specify the folder structure for this song." 0 0 0 \
                "Artist" 2 4 "" 2 20 80 0 \
                "Songname" 4 4 "" 4 20 80 0 \
                "Filename" 6 4 "" 6 20 80 0 \
                "Copyright" 8 4 "" 8 20 80 0 \
                "License" 10 4 "" 10 20 80 0 \
                "Arranger" 12 4 "" 12 20 80 0 \
                2>$_tmp3

            if [[ $? -ne 0 ]] ; then
                dialog --msgbox "Aboring and exiting script." 0 0 ;
                exit 1
            fi

            # Iterator
            i=0

            while read line
            do
                area[i]="$line"
                i=`expr $i+1`
            done <$_tmp3

            artist="${area[0]}"
            title="${area[1]}"
            filename="${area[2]}"
            copyright="${area[3]}"
            license="${area[4]}"
            arranger="${area[5]}"

            srcPath="src"
            templatePath="Templates"
            latexTemplate="template.tex"
            lilypondTemplate="template.ly"

            latexPath="${srcPath}/${filename}/LaTeX"
            lilypondPath="${srcPath}/${filename}/lilypond"

            texFile="${latexPath}/${filename}.tex"
            lilypondFile="${lilypondPath}/${filename}.ly"

            mkdir -p ${latexPath}
            mkdir -p ${lilypondPath}

            cp ${templatePath}/${latexTemplate} ${texFile}
            cp ${templatePath}/${lilypondTemplate} ${lilypondFile}

            sed 's/<SONGTITLE>/'"${title}"'/g' ${texFile} > ${_tmp4}
            cp ${_tmp4} ${texFile}

            sed 's/<ARTIST>/'"${artist}"'/g' ${texFile} > $_tmp4
            cp $_tmp4 ${texFile}

            sed 's/<COPYRIGHT>/'"${copyright}"'/g' ${texFile} > $_tmp4
            cp ${_tmp4} ${texFile}

            sed 's/<LICENSE>/'"${license}"'/g' ${texFile} > $_tmp4
            cp $_tmp4 ${texFile}

            sed 's/<INDEX>/'"${filename}"'/g' ${texFile} > $_tmp4
            cp $_tmp4 ${texFile}


            sed 's/<SONGTITLE>/'"${title}"'/g' ${lilypondFile} > $_tmp4
            cp $_tmp4 ${lilypondFile}

            sed 's/<ARTIST>/'"${artist}"'/g' ${lilypondFile} > $_tmp4
            cp $_tmp4 ${lilypondFile}

            sed 's/<ARRANGER>/'"${arranger}"'/g' ${lilypondFile} > $_tmp4
            cp $_tmp4 ${lilypondFile}

            cd ${lilypondPath}
            ln -s ../../../LilyPond/songMakefile Makefile
            cd -

            cp ${templatePath}/gitignore-Template ${lilypondPath}/.gitignore

            dialog --msgbox "Script has finished. There should be a new song in 'src/' named '${title}' in 'src/${filename}', have fun!" 0 0 ;

            ;;
        1)
            main
            ;;
        255) echo "$esc";;
    esac
}

function cleanup()
{
    rm $_tmp1
    rm $_tmp2
    rm $_tmp3
    rm $_tmp4

    unset version
    unset dialogtitle
    unset backtitle
    unset PN
    unset file
    unset _tmp1
    unset _tmp2
    unset _tmp3
    unset _tmp4
    unset DVER
    unset esc
    unset response
    unset i
    unset area
    unset artist
    unset title
    unset index
    unset copyright
    unset license
    unset arranger
    unset tex
    unset file
    unset line
    unset e
    unset srcPath
    unset templatePath
    unset latexTemplate
    unset lilypondTemplate
    unset latexPath
    unset lilypondPath
    unset texFile
    unset lilypondFile

}

main
exit 0
