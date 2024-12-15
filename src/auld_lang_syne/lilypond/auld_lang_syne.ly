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
% voicePart {{{
% ----------------------------------------

voicePart = {
  r4 r1 r2 r4

  % Should ...
  a\4 

  % all ...
  d'4. cs'8 d'4 fs'

  % be forgot ...
  e'4. d'8 e'4 fs'8 e'

  % never brought to
  d'4. d'8 fs'4 a'

  % mind ... should ...
  b'2. b'8 a'

  % all acquaintance ...
  a'4. fs'8 fs' e' d'4

  % be forgot ...
  e'4. d'8 e'4 fs'8 e'

  % days ...
  d'4. b8 b4 a

  % Syne ...
  d'2 r4 b'8 a'


  % For Auld ...
  
}

% ----------------------------------------
% voicePart }}}
% lyrics {{{
% ----------------------------------------

voiceLyrics = \lyricmode {
  Should Auld A -- cquain -- tance be for -- got
  A -- nd ne -- ver brought to mind
  Shou -- ld Auld A -- cquai -- n -- tance be for -- got
  A -- nd days of Auld Lang Syne.

  F -- or Auld La -- -- ng Syne my dear
  F -- or Auld La -- ng Syne
  We'll take a cup of kind -- ness yet
  F -- or Auld La -- ng Syne.

  And here's a hand my tru -- sty friend
  Tha -- t gives a hand to thine
  We'll take a cup of kind -- ness yet
  F -- or Auld La -- ng Syne

  F -- or Auld La -- -- ng Syne my dear
  F -- or Auld La -- ng Syne
  We'll take a cup of kind -- ness yet
  F -- or Auld La -- ng Syne.

  Should Auld A -- cquain -- tance be for -- got
  A -- nd ne -- ver brought to mind
  Shou -- ld Auld A -- cquain -- tance be for --got
  A -- nd days of Auld Lang Syne.
}

% ----------------------------------------
% lyrics }}}

% pdf {{{
% ----------------------------------------

\score
{
  <<
    \new Staff
    <<
      \global
      \voicePart
      \addlyrics
      {
        \voiceLyrics
      }
    >>

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

    \context Staff = thevoice
    {
      \set Staff.midiInstrument = #"bright acoustic"
      \transpose d d,
      {
        \voicePart
      }
    }
  >>

  \midi
  {
    \tempo 4 = 72
  }
}

% rehearsal guitar {{{
% ----------------------------------------

\book {
  \bookOutputSuffix "guitar"
  \score
  {
    \unfoldRepeats
    <<
      \context TabStaff = guitar
      {
        \set Score.midiMinimumVolume = #0.4
        \set Score.midiMaximumVolume = #0.4
        \set Staff.midiMinimumVolume = #0.8
        \set Staff.midiMaximumVolume = #1.0
        \set Staff.midiInstrument = #"acoustic guitar (nylon)"
        \transpose bf d'
        {
          \guitarPartVoice
        }
      }

      \context Staff = thevoice
      {
        \set Staff.midiInstrument = #"bright acoustic"
        \transpose d d,
        {
          \voicePart
        }
      }
    >>

    \midi
    {
      \tempo 4 = 72
    }
  }
}

% ----------------------------------------
% rehearsal guitar }}}
% rehearsal voice {{{
% ----------------------------------------

\book {
  \bookOutputSuffix "voice"
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

      \context Staff = thevoice
      {
        \set Score.midiMinimumVolume = #0.4
        \set Score.midiMaximumVolume = #0.4
        \set Staff.midiMinimumVolume = #0.8
        \set Staff.midiMaximumVolume = #1.0
        \set Staff.midiInstrument = #"bright acoustic"
        \transpose d d,
        {
          \voicePart
        }
      }
    >>

    \midi
    {
      \tempo 4 = 72
    }
  }
}

% ----------------------------------------
% rehearsal Voice }}}

% ----------------------------------------
% midi }}}
