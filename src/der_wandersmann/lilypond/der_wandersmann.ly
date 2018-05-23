% vim: ft=lilypond
\language "english"

\version "2.18.2"

\layout {
}

\header {
  title = "Der Wandersmann"
  composer = "Schandmaul"
  arranger = "Arr.: Joschka Köster"
}

#(set-global-staff-size 22)
#(set-default-paper-size "a4" 'landscape)

\paper {
  system-separator-markup = \slashSeparator
}

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

global = {
  \key d \major
  \numericTimeSignature

  \time 4/4
  \tempo 4 = 200

  \mergeDifferentlyDottedOn
  \mergeDifferentlyHeadedOn
}

cFigureA = {
  <d,\5 fsharp\1>4 fsharp,4\4 a,4\3 d4\2
}

cFigureB = {
  <d,\5 fsharp\1>4 fsharp,8\4 a,8\3 d,8\5 d8\2 a,4\3
}

dFigureA = {
  <e,\4 g\1>4 b,8\3 e8\2 b,8\3 g8\1 e4\2
}

gFigureA = {
  <a,,\6 e\2>4 d4\2 csharp4\2 a,4\3
}

gFigureB = {
  <a,,\6 e,\4 a,\3 csharp\2>4 b,,4\5 csharp,4\5 b,,4\5
}

gFigureC = {
  <a,,\6 a\1>4 e,8\4 a,8\3 a,,8\6 e8\2 a,4\3
}

aFigureA = {
  <b,,\5 fsharp\1>4 fsharp,4\4 b,4\3 d4\2
}

aFigureB = {
  <b,,\5 fsharp\1>4 fsharp,8\4 b,\3 b,,\5 d\2 b,4\3
}

guitarPartVoice = {
  \set fingeringOrientations = #'(up)
  \mark "Capo 4"
  %\unfoldRepeats {
    % takt 1 - 8 (9 - 16)
    \repeat volta 2 {
      \cFigureB
      \gFigureA
      \dFigureA
      \aFigureA
      \dFigureA
      \cFigureA
      \gFigureB

    }
    \alternative {
      { <d,\5 fsharp,\4 a,\3 d\2>2 \deadNotesOn <d,\5 fsharp,\4 a,\3 d\2>2 \deadNotesOff }
    }

    % takt 17
    \cFigureB
    \gFigureC
    \dFigureA
    \aFigureB
    \dFigureA
    \cFigureB
    \gFigureC
    \cFigureA

    % takt 17
    \cFigureB
    \gFigureC
    \dFigureA
    \aFigureB
    \dFigureA
    \cFigureB
    \gFigureC
    \cFigureA

  %}
}

voicePart = {
  %\unfoldRepeats {
    \repeat volta 2 {
      % takt 1 - 7
      r1 r r r r r r
    }
    % takt 8
    \alternative {
        { r1 }
        { r2 r4 fsharp' }
    }

    % takt 9
    b' b'8 b'4. b'4

    % takt 10
    asharp' gsharp' fsharp'4. d'8

    % takt 11
    d' d'8 d'4. d'4

    % takt 12
    d' d' d' d'

    % takt 13
    d' d'8 d'4. d'4

    % takt 14
    d' d'2.

    % takt 15
    d'4 d' d' d'

    % takt 16
    d'2 r4. d'8

    % takt 17
    d'4 d'8 d'4. d'4

    % takt 18
    d' d' d'2

    % takt 19
    d'4 d'8 d'8 d'4. d'4

    % takt 20
    d' d' d' d'

    % takt 21
    d' d'8 d'4. d'4

    % takt 22
    d' d'2.

    % takt 23
    d'4 d' d' d'

    % takt 24
    d'2 r4. d'8
  %}
}

voiceLyrics = \lyricmode {
  Es ist ge -- leert das er -- ste Fass
  kommt Brü -- der -- lein er -- zählt noch was
  von Eu -- ren wei -- ten Rei -- sen
  Sprecht und hebt das Glas.

  Der al -- te bärt -- ge Wan -- ders -- mann
  fängt mit der Ge -- schich -- te an
  als einst von fern das Jagd -- horn schallt
  und Jä -- ger hetz -- ten durch den Wald.
}

\score {
  <<
    \new ChordNames {

    }

    \new Staff <<
      \global
      \set Staff.midiInstrument = #"electric grand"
      \voicePart
      \addlyrics {
        \voiceLyrics
      }
    >>

    \new Staff <<
      \global
      \clef "G_8"
      \set Staff.midiInstrument = #"pizzicato strings"

      \new Voice = "first"
      {
        \voiceOne
        \transpose d d' {
          \guitarPartVoice
        }
      }
    >>

    \new TabStaff <<
      \global
      \set Staff.midiInstrument = #"acoustic guitar (steel)"
      \set Staff.stringTunings = \stringTuning <d, g, c f a d'>
      \set TabStaff.instrumentName = \markup { " " \DGCFAD }
      \set TabStaff.shortInstrumentName = \markup \DGCFAD
      \tabFullNotation

      \new TabVoice = "first"
      {
        \voiceOne
        \transpose d bflat {
          \guitarPartVoice
        }
      }
    >>
  >>
  \layout {
    % disable string numbers if manually specify string, e.g. e\6 (open low e
    % string)
    \omit Voice.StringNumber
  }
}

\score {
  \unfoldRepeats <<
    \context TabStaff = guitar {
      \transpose d d' {
        \guitarPartVoice
      }
    }
  >>
  \midi {
    \tempo 4 = 200
  }
}
