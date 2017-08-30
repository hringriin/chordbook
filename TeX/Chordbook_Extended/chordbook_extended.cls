\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{chordbook}
\LoadClass[12pt,a4paper,titlepage,twoside]{scrartcl}

\newcommand\myauthor{JoSh}
\title{Chordbook}
\author{``\myauthor''}

% For smileys
\RequirePackage{MnSymbol,wasysym}

\RequirePackage{xcolor}
\definecolor{linkcolor}{HTML}{0055AA}
\definecolor{citecolor}{HTML}{33BB00}
\definecolor{urlcolor}{HTML}{6655FF}
\definecolor{songnr}{HTML}{8FFFFF}
\definecolor{notes}{HTML}{FFCCCC}

%\newcommand\incls[1]{\input{input/{#1}} \sclearpage}

\RequirePackage[chorded]{songs}
\RequirePackage{caption}

% Sprachpaket
\RequirePackage[ngerman]{babel}

% Zeichensatzpaket
\RequirePackage[utf8]{inputenc}

% Seitenuebergreifende Tabellen
\RequirePackage{longtable}

% Header
\RequirePackage{fancyhdr}
\pagestyle{fancy}
\fancyhead[OL,ER]{\textbf{\myauthor's Chordbook \the\year}\\}
\fancyhead[EL,OR]{\textbf{Seite \thepage} \\ \textit{\leftmark}}

\setlength{\oddsidemargin}{0mm}
\setlength{\evensidemargin}{0mm}
\setlength{\hoffset}{-17.4mm}
\setlength{\voffset}{-22.4mm}
\setlength{\topmargin}{0mm}
\setlength{\headheight}{15mm}
\setlength{\headsep}{5mm}
\setlength{\textheight}{173mm}
\setlength{\textwidth}{280mm}
\setlength{\headwidth}{\textwidth}
\setlength{\marginparsep}{0mm}
\setlength{\marginparwidth}{0mm}
\setlength{\footskip}{10mm}

\setlength{\songnumwidth}{15mm}
\setlength{\versenumwidth}{10mm}

\renewcommand\printchord[1]{\sffamily\slshape\small#1}

\newcommand\chordbrk{\hspace*{6.2mm}}

% Einbinden von PDFs mit
%   Seiten von .. bis
%   \includepdf[pages=VON-BIS]{/path/to/file}
%
%   Alle Seiten
%   \includepdf[pages=-]{/path/to/file}
%
%   Alle Seiten, aber in umgekehrter Reihenfolge
%   \includepdf[pages=last-1]{/path/to/file}
%
%   Nur die Seiten 2, 5, eine leere Seite und 6
%   \includepdf[pages=2,5,{},6]{/path/to/file}
%
% eine Kombination ist nicht moeglich!
%
% Wird fuer [pages=...] kein Wert sondern nur \include{/path/to/file} verwendet,
% so entspricht das \includepdf[pages=1]{/path/to/file}
%
% Die Option ``nup'' kann mehrere Seiten eines Dokumentes auf eine kopieren
%
%   Eine Spalte, zwei Zeilen
%   \includepdf[pages=2-5,nup=1x2]{/path/to/file}
%
%   Zwei Spalten, eine Zeile
%   \includepdf[pages=2-5,nup=2x1]{/path/to/file}
%
%   [width=\textwidth]
%
% Seiten im Landscapeformat mit der Option ``landscape=true'' einbinden
\RequirePackage[final]{pdfpages}

% Verweise innerhalb des Dokumentes schick mit "{Kapitel#} auf Seite ..."
% automatisch versehen. Dazu \vref{labelname} benutzen.

% keine Seitenzahlen mittig unten (footer loeschen)
\cfoot{}

% Verweise innerhalb des Dokumentes schick mit "{Kapitel#} auf Seite ..."
% automatisch versehen. Dazu \vref{labelname} benutzen.
\RequirePackage[ngerman]{varioref}

% Lipsum
\RequirePackage{lipsum}
