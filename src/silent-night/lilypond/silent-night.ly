% vim: set ft=lilypond

\version "2.18.2"

\layout {
}

\header {
  title = "Silent Night"
  composer = "Darrell Braun"
  arranger = "Darrell Braun"
}

#(set-global-staff-size 22)

\paper {
  system-separator-markup = \slashSeparator
}

global = {
  %\key bes \major
  %\numericTimeSignature

  %\time 4/4
  %\tempo 4 = 140

  %\mergeDifferentlyDottedOn
  %\mergeDifferentlyHeadedOn
}

guitarPart = {
  \set fingeringOrientations = #'(up)
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
      \set Staff.stringTunings = \stringTuning <c, g, c f a d'>
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
    \tempo 4 = 140
  }
}
