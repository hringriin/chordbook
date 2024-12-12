% vim: ft=lilypond

\language "english"

\version "2.24.4"

\layout {
}

% header {{{
% ----------------------------------------

\header {
  title = "<SONGTITLE>"
  composer = \markup { \bold {Music:} <ARTIST>}
  arranger = \markup { \bold {Arrangement:} <ARRANGER>}
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
  \key a \major
  \numericTimeSignature

  \time 3/4
  \tempo 4 = 90

  %\mergeDifferentlyDottedOn
  %\mergeDifferentlyHeadedOn
}

% ----------------------------------------
% global settings }}}
% guitarPart {{{
% ----------------------------------------
guitarPart = {
  \set fingeringOrientations = #'(up)
}

% ----------------------------------------
% guitarPart }}}
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
        \transpose g b
        {
          \guitarPart
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
        \guitarPart
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
        \transpose g b
      {
        \guitarPart
      }
    }
  >>

  \midi
  {
    \tempo 4 = 90
  }
}

% ----------------------------------------
% midi }}}
