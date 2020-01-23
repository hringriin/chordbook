% vim: ft=lilypond:

\language "english"

\version "2.19.83"

% header {{{
% ----------------------------------------

\header {
  title = "Das Bier ich in der Rechten trug"
  composer = \markup { \bold {Music:} Versengold}
  arranger = \markup { \bold {Arrangement:} Joschka Köster}
  tagline = "Engraved with LilyPond - by Joschka Köster"
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
    1.5 scalefont
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

  \time 6/8
  \tempo 8 = 190

  \mergeDifferentlyDottedOn
  \mergeDifferentlyHeadedOn
}

% ----------------------------------------
% global settings }}}

% figures {{{
% ----------------------------------------

dFigureA = {
  <d\4 e'\1>16 (fs'\1) d'8\2 a\3 <fs'\1 d'\2> a\3 d\4
}

dFigureB = {
  d8\4 a\3 d'\2 fs'\1 d'\2 e'\1
  \tuplet 3/2 { <d\4 e'\1>16 (fs'\1 e'\1) } d'8\2 a\3 d'\2 g,\6 a,\5

}

aFigureA = {
  a,\5 e\4 a\3 <cs'\2 e'\1> a\3 d\4
}

gFigureA = {
  g,\6 d\4 g\3 <d'\2 g'\1> g\3 d\4
  g,\6 d16\4 (e\4) g8\3 <d'\2 g'\1> d'8\2 e'\1
}

gFigureB = {
  g,\6 d\4 g\3 <d'\2 g'\1> g\3 d\4
  g,\6 d\4 g\3 <d'\2 g'\1> d'8\2 e'\1
}

gaFigureA = {
  g,\6 d\4 <g\3 d'\2 g'\1> a,\5 e\4 <g\3 b\2>
}

intro = {
  \dFigureA
  \aFigureA
  \gFigureA
  \dFigureA
  \aFigureA
  \gaFigureA
  \dFigureB
}

vers = {
  \dFigureA
  \aFigureA
  \gFigureB
  \dFigureA
  \aFigureA
  \gFigureA

  \dFigureA
  \aFigureA
  \gFigureB
  \dFigureA
  \aFigureA
  \gaFigureA
  \dFigureB
}

% ----------------------------------------
% figures }}}
% guitarPart Voice {{{
% ----------------------------------------

guitarPartVoice = {
  \set fingeringOrientations = #'(up)
  \mark "Capo 2"

  % auftakt
  \partial 4 d'8\2 e'\1

  % takt 1
  \intro

  \vers
  \vers
}

% ----------------------------------------
% guitarPart voice }}}
% voicePart {{{
% ----------------------------------------

voicePart = {
}

% ----------------------------------------
% voicePart }}}
% lyrics {{{
% ----------------------------------------

voiceLyrics = \lyricmode {
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
        \transpose d d
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
        \transpose d c
        {
          \guitarPartVoice
        }
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
      \transpose d d'
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
    \tempo 4 = 200
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
        \set Score.tempoWholesPerMinute = #(ly:make-moment 130 4)
        \set Score.midiMinimumVolume = #0.4
        \set Score.midiMaximumVolume = #0.4
        \set Staff.midiMinimumVolume = #0.8
        \set Staff.midiMaximumVolume = #1.0
        \set Staff.midiInstrument = #"acoustic guitar (nylon)"
        \transpose d d'
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
      \tempo 4 = 200
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
        \transpose d d'
        {
          \guitarPartVoice
        }
      }

      \context Staff = thevoice
      {
        \set Score.tempoWholesPerMinute = #(ly:make-moment 130 4)
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
      \tempo 4 = 200
    }
  }
}

% ----------------------------------------
% rehearsal Voice }}}

% ----------------------------------------
% midi }}}
