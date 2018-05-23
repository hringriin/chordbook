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

global = {
  \key d \major
  \numericTimeSignature

  \time 4/4
  \tempo 4 = 200

  \mergeDifferentlyDottedOn
  \mergeDifferentlyHeadedOn
}

guitarPartVoice = {
  \set fingeringOrientations = #'(up)

  \unfoldRepeats {
    % takt 1 - 8
    \repeat volta 2 {
      <bflat,\5 d'\1>4^"capo 4" d8\4 f8\3 bflat,8\5 bflat8\2 f4\3
      <f,\6 c'\2>4 bflat\2 a\2 f\3
      <c\3 eflat'\1> g8\3 c'\2 c\3 eflat'\1 c'4\2
      <g,\5 d'\1>4 d\4 g\3 bflat\2
      <c\3 eflat'\1> g8\3 c'\2 c\3 eflat'\1 c'4\2
      <bflat,\5 d'\1>4 d\4 f\3 bflat\2
      <f,\6 c\4 f\3 a\2>4 g,\5 a,\5 g,\5
      <bflat,\5 d\4 f\3 bflat\2>2 \deadNotesOn <bflat,\5 d\4 f\3 bflat\2>2 \deadNotesOff
    }

    % takt 9
    <bflat,\5 d'\1>4 d8\4 f8\3 bflat,8\5 bflat8\2 f4\3
    <f,\6 f'\1>4 c8\4 f\3 f,\6 c'\2 f4\3
    <c\3 eflat'\1> g8\3 c'\2 c\3 eflat'\1 c'4\2
    <g,\5 d'\1>4 d8\4 g\3 g,\5 bflat\2 g4\3
    <c\3 eflat'\1> g8\3 c'\2 c\3 eflat'\1 c'4\2
    <bflat,\5 d'\1>4 d8\4 f\3 bflat,\5 bflat\2 f4\3
    <f,\6 f'\1>4 c8\4 f\3 f,\6 c'\2 f4\3
    <bflat,\5 d'\1>4 d\4 f\3 bflat\2

  }
}

voicePart = {
  \unfoldRepeats {
    \repeat volta 2 {
      % takt 1 - 7
      r1 r r r r r r

      % takt 8
      r2 r4 d'
    }


    % takt 9
    d' d'8 d'4. d'4

    % takt 10
    d' d' d' d'

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
    d'2 r
  }
}

voiceLyrics = \lyricmode {
  Es ist ge -- leert das er -- ste Fass
  kommt Brü -- der -- lein er -- zählt noch was
  von Eu -- ren wei -- ten Rei -- sen
  Sprecht und hebt das Glas.
}

guitarPartBass = {
  \set fingeringOrientations = #'(up)
}

\score {
  <<
    \new ChordNames {
    }

    \new Staff <<
      \global
      \clef "G_8"
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
        \guitarPartVoice
      }
      \new Voice = "second"
      {
        \voiceTwo
        \guitarPartBass
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
        \guitarPartVoice
      }
      \new TabVoice= "second"
      {
        \voiceTwo
        \guitarPartBass
      }
    >>
  >>
  \layout {
    %disable string numbers if manually specify string, e.g. e\6 (open low e string)
    \omit Voice.StringNumber
  }
  \midi {
    \context {
      \Staff
      \remove "Staff_performer"
    }
    \context {
      \Voice
      \consists "Staff_performer"
    }
    \tempo 4 = 200
  }
}
