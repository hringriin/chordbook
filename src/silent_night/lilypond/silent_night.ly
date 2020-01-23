% vim: set ft=lilypond

\language "english"

\version "2.19.83"

\layout {
}

% header {{{
% ----------------------------------------
\header {
  title = "Silent Night"
  composer = \markup { \bold {Music:} Franz Xaver Gruber}
  arranger = \markup { \bold {Arrangement:} Darrell Braun}
  instrument = "Guitar"
  tagline = "Engraved with Lilypond - by Joschka Köster"
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
  \mark "Capo 4"

  % takt 1
  <f, c'>8 c f d' c' f

  % takt 2
  <f, a>8 c f a f c

  % takt 3
  <f, c'>8 c f d' c' f

  % takt 4
  <f, a>8 c f a f c

  % takt 5
  \arpeggioArrowUp
  <g, bf\3 d'\2 g'\1>\arpeggio f\4 bf\3 d'\2 g'\1 f\3

  % takt 6
  <e, e'>8 c\4 g\3 c'\2 e'\1( f')

  % takt 7
  <f, f'>8 c\4 f\3 c'\2 f'\1 f\3

  % takt 8
  <f, c'>8 f\3 g,\5 f\3 a,\5 c\4

  % takt 9
  <bf, f bf d'>8\arpeggio c\4 f bf d' f

  % takt 10
  <d f bf f'>8\arpeggio f bf e' d' f

  % takt 11
  <f, c'>8 c f d' c' f

  % takt 12
  <f, a>8 c f a f c

  % takt 13
  <bf, f bf d'>8\arpeggio c\4 f bf d' f

  % takt 14
  <d f bf f'>8\arpeggio f bf e' d' f

  % takt 15
  <f, c'>8 c f d' c' f

  % takt 16
  <f, a>8 c f a f c

  % takt 17
  <g, bf\3 d'\2 g'\1>\arpeggio f\4 bf\3 d'\2 g'\1 f\3

  % takt 18
  <f\4 bf d' bf'>\arpeggio bf\3 <d' g'> bf\3 <b e'> g\3

  % takt 19
  <f, f c' f'>\arpeggio c f c' f' \glissando a'

  % takt 20
  <f, a'>8 c f a f c

  % takt 21
  <f, f c' f'>\arpeggio c c' c a c

  % takt 22
  <ff, c'>8 c g bf g c

  % takt 23
  <f, f> c f a f c

  % takt 24
  <c'\4 f'\3 a'\2>2.\flageolet\fermata
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
