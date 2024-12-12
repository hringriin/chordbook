% vim: ft=lilypond:

\version "2.24.4"

\layout {
}

\header {
  title = "Pippi Langstrumpf"
  composer = "Jan Johansson and Konrad Elfers"
  arranger = "JoSh"
  tagline = "Sheet engraved by JoSh"
}

#(set-global-staff-size 18)
#(set-default-paper-size "a4" 'landscape)

\paper {
  system-separator-markup = \slashSeparator
}

global = {
  \key c \major
  \numericTimeSignature

  \time 4/4
  \tempo 4 = 100

  %\mergeDifferentlyDottedOn
  %\mergeDifferentlyHeadedOn
}

guitarPart = {
  \set fingeringOrientations = #'(up)
  % takt 1
  %< c,~ bes,-2 >8^Intro \glissando < c, c\5-2 >4. < c, c\5-2 >2
  <c\5-3 g>8 e-2 e' g <d\4 d'\2-1> a-2 f'16\1-1 e'\1 d'\2-3 c'\2-1

  % takt 2
  <g,\6-3 b\2>8 d'\2-4 <d\4 g\3> b <c-1 c'-3> g <e-2 e'> g
}


\score {
  <<
    \new ChordNames {
    }

    \new Staff {
      \global
      \clef "G_8"
      \set midiInstrument = #"acoustic guitar (steel)"
      \guitarPart
    }

    \new TabStaff {
      \global
      %\set midiInstrument = #"acoustic guitar (steel)"
      \set Staff.stringTunings = \stringTuning <e, a, d g b e'>
      \tabFullNotation
      \guitarPart
    }
  >>
  \layout {
    % disable string numbers if manually specify string, e.g. e\6 (open low e string)
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
    \tempo 4 = 100
  }
}
