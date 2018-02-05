# Chordbook

## About this Repository in my native language

Dieses *Chordbook* stellt eine persönliche und vielfältige Sammlung von Liedgut dar, die ich über
die Jahre gesammelt habe.  Ich erhebe keinen Anspruch auf Eigentum oder Richtigkeit der
Dargestellten Texte oder Akkorde, z.T. habe ich sie von anderen Menschen übernommen und mit der Zeit
selbst abgewandelt, z.T.  habe ich sie mir selber durch Hören oder Video-Material abkupfern können.

Sollte es Einwände gegen ein oder mehrere Lieder oder Texte geben, bin ich über meine E-Mail Adresse
`hringriin@gmail.com` erreichbar.

Dank **Fagus vom Friedrichshain** konnte ich mein Chordbook um einige Stücke erweitern.  Seine
Beiträge sind gekennzeichnet oder werden noch gekennzeichnet werden.

This is a collection of texts and chords of various artists, formed to a *Chordbook* mainly with
`LaTeX's` [`songs`][songspkg]-Package by *Kevin W. Hamlen*


## Using this repository

Please note that I *do not support* compiling this document on Windows or Mac OS any further.


### Prerequisites

You need `Texlive` and `Perl` installed
Check your distributions package manager on how to do so.

On `Arch Linux` install every texlive package with `pacman -S $(pacman -Ssq texlive)`

`Ubuntu` users can do so by typing `apt install texlive*`.

**Please note that this is not the most elegant way no how to install Texlive, but it makes sure,
that every package needed by this project is installed.**

Make sure that Perl is installed.


### Compile

To compile simply type `make` after a directory change into `Chordbook/Unix`


#### Extended Version

If you have `lilypond` installed, you can also type `make lilypond` to compile
all lilypond files at once. If you type `make extended` you will compile the
*normal* chordbook **and** an extended version with all lilypond files and
notations and all the stuff I gathered around each song as well.

**Please note that compiling the lilypond files at once may take a very long time. You probably want
to run that on a beefier computer.**

**Please note that the extended chordbook version is in a pre-alpha state and not meant to be
working to this time.**


## Getting the Chordbook

There is a monthly updated version on my homepage, for people who do not want to compile it by
themselves.  You can download it [here][cbdlpage].


## Misc

I'd love to know about your opinion about this "book".
I'd appreciate every kind of help!

For bugs or everything regarding the content, please write an issue or do a pull request.

You cann always [write an E-Mail][mailme] for any kind of information regarding this repository.



[songspkg]: http://songs.sourceforge.net/index.html "Songs Package"
[mailme]: mailto:hringriin@gmail.com "Mail Me"
[mactex]: https://tug.org/mactex/ "MacTex-2015"
[miktexdlpage]: https://miktex.org/download "MikTex Download"
[perldllink]: https://storage.googleapis.com/google-code-archive-downloads/v2/code.google.com/dwimperl/dwimperl-5.14.2.1-v7-32bit.exe "Perl for Windows"
[cbdlpage]: https://chordbook.niederhoelle.de "Downloadpage Chordbook"
