% vim: set ft=lilypond
\language "english"

\version "2.18.2"

\layout {
}

\header {
  title = "Silent Night"
  composer = "Darrell Braun"
  arranger = "Darrell Braun"
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
  \key bf \major
  \numericTimeSignature

  \time 3/4
  \tempo 4 = 90

  %\mergeDifferentlyDottedOn
  %\mergeDifferentlyHeadedOn
}

guitarPart = {
  \set fingeringOrientations = #'(up)

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
  <f, c'>8 f\3 g,\5 f\3 bf,\5 c\4

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
}


\score {
  <<
    \new ChordNames {
    }

    %\new Staff {
      %\global
      %\clef "G_8"
      %\set midiInstrument = #"acoustic guitar (steel)"
      %\guitarPart
    %}

    \new TabStaff {
      \global
      \set midiInstrument = #"acoustic guitar (steel)"
      \set Staff.stringTunings = \stringTuning <d, g, c f a d'>
      \set TabStaff.instrumentName = \markup { " " \DGCFAD }
      \set TabStaff.shortInstrumentName = \markup \DGCFAD
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
