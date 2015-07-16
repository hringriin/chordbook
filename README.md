# Chordbook

## About this Repository

This is a collection of texts and chords of various artists, formed to a *Chordbook* mainly with `LaTeX's` [`songs`][songspkg]-Package by *Kevin W. Hamlen*

## Usage

You need `LaTeXe2` installed, this can be achieved e.g. by installing the `texlive` Package under Linux or `MiKTeX` under Windows.

Windows might be a douche about the [`songs`][songspkg] -Package; ~~you propably will have to install it on your own or put the songs.sty into the `Chordbook/Windows` folder.~~ I put the file `songs.sty` in the Windows folder, so you won't have any trouble compiling it because of a missing style.

It can be downloaded [here][songspkg] as soon as I can provide a link to the style.

### Windows

To compile the code it should be sufficient to run the `COMPILE.bat` ***AFTER CORRECTING THE PATHS TO YOUR NEEDS***. For troubleshooting [mail me][mailme].

The Batch file expects PERL to be installed but it isn't necessary, because there are no references and no glossary entries made, yet.

### Linux

To compile simply type `make` after a directory change into `Chordbook/Linux`

[songspkg]: http://songs.sourceforge.net/index.html "Songs Package"
[mailme]: hringriin@niederhoelle.org "Mail Me"
