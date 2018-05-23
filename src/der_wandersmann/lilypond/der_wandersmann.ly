% vim: ft=lilypond:
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

  % takt 1 - 8 (9 - 16)
  \repeat volta 2 {
    <bflat,\5 d'\1>4^"capo 4" d8\4 f8\3 bflat,8\5 bflat8\2 f4\3
    <f,\5 c'\2>4 bflat\2 a\2 f\3
    <c\3 eflat'\1> g8\3 c'\2 c\3 eflat'\1 c'4\2
    <g,\5 d'\1>4 d\4 g\3 bflat\2
    <c\3 eflat'\1> g8\3 c'\2 c\3 eflat'\1 c'4\2
    <bflat,\5 d'\1>4 d\4 f\3 bflat\2
    <f,\6 c\4 f\3 a\2>4 g,\5 a,\5 g,\5
    <bflat,\5 d\4 f\3 bflat\2>2 \deadNotesOn <bflat,\5 d\4 f\3 bflat\2>2 \deadNotesOff

    % takt 17
  }
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
      \set Staff.midiInstrument = #"acoustic guitar (steel)"

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
