\version "2.18.2"

\layout {
}

CGCFAD =
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
                (C) show
                stroke"
}

\header {
  title = "God's gonna cut you down"
  composer = "Johnny Cash"
  arranger = "Kate Aumonier & Ben Parker"
  tagline = "Sheet engraved by JoSh"
}

#(set-global-staff-size 18)
#(set-default-paper-size "a4" 'landscape)

\paper {
  system-separator-markup = \slashSeparator
}

global = {
  \key bes \major
  \numericTimeSignature

  \time 4/4
  \tempo 4 = 140

  %\mergeDifferentlyDottedOn
  %\mergeDifferentlyHeadedOn
}

guitarPart = {
  \set fingeringOrientations = #'(up)
  % takt 1
  < c,~ bes,-2 >8^Intro \glissando < c, c\5-2 >4. < c, c\5-2 >2

  % takt 2
  < c,~ bes,-2 >8 \glissando < c, c\5-2 >4. < c, c\5-2 >2

  % takt 3
  < c,~ bes,-2 >8 \glissando < c, c\5-2 >4. < c, c\5-2 >2

  % takt 4
  < \deadNote c, \deadNote bes, >8 < es,\6-2 \deadNote bes,\5-2 es\4-3 >4.\prall < c, c\5 >2

  % takt 5
  < c,~ bes,-2 >8 \glissando < c, c\5-2 >4. < c, c\5-2 >2

  % takt 6
  < c,~ bes,-2 >8 \glissando < c, c\5-2 >4. < c, c\5-2 >2

  % takt 7
  < c,~ bes,-2 >8 \glissando < c, c\5-2 >4. < c, c\5-2 >2

  % takt 8
  < \deadNote c, \deadNote bes, >8 < es,\6-2 \deadNote bes,\5-2 es\4-3 >4.\prall < c, c\5-2 >2

  \break
  % takt 9
  < c, c\5-1 >2^Verse < c\5-1 \deadNote es\4-1 c'\3-4 \parenthesize e'\2\harmonic-4 >

  % takt 10
  < c, c\5-1 >2 < c\5-1 \deadNote es\4-1 c'\3-4 \parenthesize e'\2\harmonic-4 >

  % takt 11
  < f,\6-2 c\5-2 f\4-3 >2 < c\5-2 f\4-3 \parenthesize f\3  a\2 >

  % takt 12
  < c, c\5-1 >2 < c\5-1 \deadNote es\4-1 c'\3-4 \parenthesize e'\2\harmonic-4 >

  \break
  % takt 13
  < c, c\5-1 >2 < c\5-1 \deadNote es\4-1 c'\3-4 \parenthesize e'\2\harmonic-4 >

  % takt 14
  < c, c\5-1 >2 < c\5-1 \deadNote es\4-1 c'\3-4 \parenthesize e'\2\harmonic-4 >

  % takt 15
  \repeat volta 2 {
    < es,\6-2 bes,\5-2 es\4-3 >4. < c,\6 g,\5 c\4 >8~ < c,\6 g,\5 c\4 >2

  % takt 16
    < bes,\5-1 \deadNote f\4 bes\3-4 >4 < bes,\5-1 \deadNote f\4 bes\3-4 >8 \glissando < c\5-1 \deadNote g\4 c'\3-4 >8 < c\5-1 \deadNote g\4 c'\3-4 >2
  }
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
      \set TabStaff.instrumentName = \markup { " " \CGCFAD }
      \set TabStaff.shortInstrumentName = \markup \CGCFAD
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
