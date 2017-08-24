# ATTENTION PLEASE

**The support for compiling this on windows via one of the scripts / makefiles in this repository is temporarily discontinued.**

# Chordbook

## About this Repository in my native language

Dieses *Chordbook* stellt eine persönliche und vielfältige Sammlung von Liedgut dar, die ich über die Jahre gesammelt habe.
Ich erhebe keinen Anspruch auf Eigentum oder Richtigkeit der Dargestellten Texte oder Akkorde, z.T. habe ich sie von anderen Menschen übernommen und mit der Zeit selbst abgewandelt, z.T. habe ich sie mir selber durch Hören oder Video-Material abkupfern können.

Sollte es Einwände gegen ein oder mehrere Lieder oder Texte geben, bin ich über meine E-Mail Adresse `hringriin@gmail.com` erreichbar.

Dank **Fagus vom Friedrichshain** konnte ich mein Chordbook um einige Stücke erweitern.
Seine Beiträge sind gekennzeichnet oder werden noch gekennzeichnet werden.


This is a collection of texts and chords of various artists, formed to a *Chordbook* mainly with `LaTeX's` [`songs`][songspkg]-Package by *Kevin W. Hamlen*


## Using this repository

You need `LaTeXe2` installed, this can be achieved e.g. by installing the `texlive` Package under Linux or `MiKTeX` under Windows.

Windows might be a douche about the [`songs`][songspkg] -Package; ~~you propably will have to install it on your own or put the songs.sty into the `Chordbook/Windows` folder.~~
I put the file `songs.sty` in the Windows folder, so you won't have any trouble compiling it because of a missing style.

It can be downloaded [here][songspkg] as well.


### Windows

#### Prerequisites

You need [`MikTex`][miktexdlpage] and [`Perl`][perldllink] installed.


#### The Batch file

The first line of the Batch files contains a Command to add the Perl interpreter to your PATH variables - check your Perl installation and adjust the path to your needs


#### Compiling

To compile the code it should be sufficient to run the `COMPILE.bat` ***AFTER CORRECTING THE PATHS TO YOUR NEEDS***.
For troubleshooting [mail me][mailme].

The Batch file expects PERL to be installed but it isn't necessary, because there are no references and no glossary entries made, yet.
It will propably be necessary to comment out that specific line(s) in the batch file, if you choose to run the batch file without having Perl installed.

If there are troubles, you can [write an email][mailme] or write an issue.


### Unix (Linux/Mac OS)

#### Prerequisites

##### Linux 

You need `Texlive` and `Perl` installed
Check your distributions package manager on how to do so.

On `Arch Linux` install every texlive package with `pacman -S $(pacman -Ssq texlive)`


Perl will probably already be installed.

##### Mac OS

You need [MacTex-2015][mactex] installed and then activated via `texdistmgr activate TexLive-2015`.


#### Compile

To compile simply type `make` after a directory change into `Chordbook/Unix`

If there are troubles, you can [write an email][mailme] or write an issue.


## Getting the Chordbook

I will do my very best to prepare a working and corrected version of my Chordbook regularly.
You can download it [here][cbdlpage] for now.

I know, that this page might look weird for people who are not used to Github, I will work on a better solution.


## Misc

If you want to communicate with me regarding anything you'd like, please write an [email][mailme] or write an issue.
I'd love to know your opinion about the project, about individual songs or whatever comes to your mind regarding this repository.



[songspkg]: http://songs.sourceforge.net/index.html "Songs Package"
[mailme]: mailto:hringriin@gmail.com "Mail Me"
[mactex]: https://tug.org/mactex/ "MacTex-2015"
[miktexdlpage]: https://miktex.org/download "MikTex Download"
[perldllink]: https://storage.googleapis.com/google-code-archive-downloads/v2/code.google.com/dwimperl/dwimperl-5.14.2.1-v7-32bit.exe "Perl for Windows"
[cbdlpage]: https://github.com/hringriin/chordbook/tree/master/Chordbook "Downloadpage Chordbook"
