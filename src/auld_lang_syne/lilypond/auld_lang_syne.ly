% vim: ft=lilypond

\language "english"

\version "2.24.4"

\layout {
}

% header {{{
% ----------------------------------------

\header {
  title = "Auld Lang Syne"
  composer = \markup { \bold {Music:} "Scottish Traditional" }
  arranger = \markup { \bold {Arrangement:} "Joschka Köster" }
  instrument = "Guitar"
  tagline = #(string-append "Engraved with LilyPond - by Joschka Köster (Build: " (strftime "%d.%m.%Y" (localtime (current-time))) ")" )
}

#(set-global-staff-size 22)
#(set-default-paper-size "a4landscape")

\paper {
  system-separator-markup = \slashSeparator
}

% ----------------------------------------
% header }}}
% guitar tuning {{{
% ----------------------------------------

DGCFAD =
\markup {
  \with-dimensions #'(0 . 0.8) #'(0 . 1.0)
  \postscript #"/Arial-Bold findfont
                1.3 scalefont
                setfont 0 3.6 moveto
                (D) show 0 2.0 moveto
                (A) show 0 0.6 moveto
                (F) show 0 -0.8 moveto
                (C) show 0 -2.2 moveto
                (G) show 0 -3.6 moveto
                (D) show
                stroke"
}

% ----------------------------------------
% guitar tuning }}}
% global settings {{{
% ----------------------------------------

global = {
  \key d \major
  \numericTimeSignature

  \time 4/4
  \tempo 4 = 72

  %\mergeDifferentlyDottedOn
  %\mergeDifferentlyHeadedOn
}

% ----------------------------------------
% global settings }}}
% guitarPart Voice {{{
% ----------------------------------------

guitarPartVoice = {
  \set fingeringOrientations = #'(up)
  \mark "Capo 4"

  % takt 1
  \partial 4 f4\3 |
  <bf\2 bf,\5>8 d\4 f\3 a\2 <bf\2 g,\5> d\4 d'\1 f\3 |
  <f,\6 c'\2> c\4 f\3 bf\2 <a,\5 c'\2> f\3 d'\1 c'\2 |
  \arpeggioArrowUp
  <bf\2 f\3 d\4 bf,\5>\arpeggio d\4 <bf\2 f\3> d\4 <bf,\5 f\3 bf\2 d'\1>\arpeggio f\3 <bf\2 f'\1> f\3 |
  <ef\4 bf\3 d'\2 g'\1>\arpeggio bf\3 d'\2 g'\1 ef\4 a\3 g'\1 \glissando f'\1 |
  <bf,\5 f\3 bf\2 f'\1>\arpeggio f\3 bf\2 d'\1 <g,\5 d'\1> d\4 bf\2 g\3 |
  <f,\6 c'\2> c\4 f\3 bf\2 <a,\5 c'\2> f\3 d'\1 c'\2 |
  <g,\5 d\4 g\3 bf\2>\arpeggio d\4 g\3 d\4 <ef,\6 g\3> ef\4 <f,\6 f\3> c\4 |
  <bf,\5 ef\4 f\3 bf\2> ef\4 f\3 bf\2 <bf,\5 d\4>2 |
}

% ----------------------------------------
% guitarPart Voice }}}
% pdf {{{
% ----------------------------------------

\score
{
  <<
    \new Staff
    <<
      \global
      \clef "G_8"

      \new Voice = "first"
      {
        \voiceOne
        \transpose bf d'
        {
          \guitarPartVoice
        }
      }
    >>

    \new TabStaff
    <<
      \global
      \set Staff.stringTunings = \stringTuning <d, g, c f a d'>
      \set TabStaff.instrumentName = \markup { " " \DGCFAD }
      \set TabStaff.shortInstrumentName = \markup \DGCFAD
      \tabFullNotation

      \new TabVoice = "first"
      {
        \voiceOne
        \guitarPartVoice
      }
    >>
  >>

  \layout {
    % disable string numbers if manually specify string, e.g. e\6 (open low e
    % string)
    \omit Voice.StringNumber
    \override LyricSpace.minimum-distance = #2.0
  }
}

% ----------------------------------------
% pdf }}}
% midi {{{
% ----------------------------------------

\score
{
  \unfoldRepeats
  <<
    \context TabStaff = guitar
    {
      \set Staff.midiInstrument = #"acoustic guitar (nylon)"
        \transpose bf d'
      {
        \guitarPartVoice
      }
    }
  >>

  \midi
  {
    \tempo 4 = 72
  }
}

% ----------------------------------------
% midi }}}
