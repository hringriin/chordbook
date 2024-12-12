% vim: ft=lilypond:

\version "2.24.4"

\layout {
}

\header {
  title = "I See Fire"
  composer = "Ed Sheeran"
  arranger = "Gareth Evans, adapted by Joschka Köster"
}

#(set-global-staff-size 22)
#(set-default-paper-size "a4" 'landscape)

\paper {
  system-separator-markup = \slashSeparator
}




global = {
  \key g \major
  \numericTimeSignature
  
  \time 2/4
  \tempo 4 = 83
  
  \mergeDifferentlyDottedOn
  \mergeDifferentlyHeadedOn
  
 
}

% erste stimme
soprano = {
  \global
  \clef "treble_8"
  % Musik folgt hier.
  
  b2 a4. g8		% takt 1
  g2 d4 a		% takt 2
  (a1)			% takt 3
  r2. r8 g		% takt 4
  b g4. g4 c'		% takt 5
  c'2 b			% takt 6
  g2. c'4		% takt 7
  c'8 c'4. b2		% takt 8
  (b) b			% takt 9
  d1			% takt 10 
  
  R1*3			% takt 11 bis 13
  
  b4 b a a		% takt 14
  g2 d4 b		% takt 15
  (b1)			% takt 16
  
  R1*92
}

% zweite stimme
alto = {
  \global
  %\clef "treble_8"		% DIESE ZEILE LOESCHEN!!! JA, DIE GANZE!!!
  % Musik folgt hier.
  d'2 c'4. c'8		% takt 1
  b2 g4 d'		% takt 2
  (d'1)			% takt 3
  r2. r8 d'		% takt 4
  d' c'4. b4 e'		% takt 5
  e'2 d'		% takt 6
  b2. e'4		% takt 7
  e'8 e'4. d'2		% takt 8
  (d') d'		% takt 9
  b1			% takt 10
  
  R1*98
}



sopranoVerse = \lyricmode {
  % Text folgt hier.
  Cold is the wa -- ter -- -
  It free -- zes your al -- ready cold mind,
  Al -- rea -- dy cold, cold mind.
  Death is at your door -- step --
  And it will steal your
}

altoVerse = \lyricmode {
  % Text folgt hier.
  Cold is the wa -- ter -- -
  It free -- zes your al -- ready cold mind,
  Al -- rea -- dy cold, cold mind.
  Death is at your door -- step --
  And it will steal your
}

rehearsalMidi = #
(define-music-function
 (parser location name midiInstrument lyrics) (string? string? ly:music?)
 #{
   \unfoldRepeats <<
     \new Staff = "soprano" \new Voice = "soprano" { s1*0\f \soprano }
     \new Staff = "alto" \new Voice = "alto" { s1*0\f \alto }
     \new Staff = "right" \new voice = "right" { s1*0\f \right }
     \new Staff = "left" \new voice = "left" { s1*0\f \left }
     \context Staff = $name {
       \set Score.midiMinimumVolume = #0.5
       \set Score.midiMaximumVolume = #0.5
       \set Score.tempoWholesPerMinute = #(ly:make-moment 111 4)
       \set Staff.midiMinimumVolume = #0.8
       \set Staff.midiMaximumVolume = #1.0
       \set Staff.midiInstrument = $midiInstrument
     }
     \new Lyrics \with {
       alignBelowContext = $name
     } \lyricsto $name $lyrics
   >>
 #})

right = {
  \global
  \clef moderntab
  
  % Musik folgt hier.
  %\set PianoStaff.connectArpeggios = ##t
 
  << e,16 a e'\2>> b32\3 a g16 d (e\3) g << c d g >> e\3	% takt 1
  (e4\3) \deadNote << a d g b >>				% takt 2
  
  g, d g, g g, d g, g				% takt 3
  g, d g, g g, d g, g				% takt 4
  g, d g, g g, d g, g				% takt 5
  c g c g c g c g 				% takt 6
  c g c g c g c g				% takt 7
  c g c g c g c g				% takt 8
  c g c g c g c g				% takt 9
  g, d g, g g, d g, g				% takt 10
  g, g g, d e g g, e				% takt 11
  << g, d >> d g, g g, d g, g			% takt 12
  g, d g, g g, d g, g				% takt 13
  g, d g, g g, d g, g				% takt 14
  g, d g, g g, d g, g				% takt 15
  g, d g, g g, d g, g				% takt 16
  g, d g, g g, d g, g				% takt 17
  g, d g, g g, d g, g				% takt 18
  c g c g c g c g				% takt 19
  c g c g c g c g				% takt 20
  c g c g c g c g				% takt 21
  c g c g c g c g				% takt 22
  g, d g, g g, d g, g				% takt 23
  g, d g, d e g g, e				% takt 24
  d d g, g g, d g, g				% takt 25
  g, d g, g g, d g, g				% takt 26
  d a d a d a d a				% takt 27
  c g c g c g c g				% takt 28
  g, d g, g g, d g, g				% takt 29
  g, d g, g g, d g, g				% takt 30
  d a d a d a a, a				% takt 31
  c g c g c << g b >> c g			% takt 32
  g, d g, << g b >> g, d g, g			% takt 33
  c g c b c g c << g b >>			% takt 34
  d a d d' d a d a				% takt 35
  g, g d g fis, g d g				% takt 36
  e, g e b e g << e b >> << e, e' >>		% takt 37
  e g e << b e' >> e g e << e, g b >>		% takt 38
  g, d g, g g, d g, g				% takt 39
  g, g g, d e g g, << e c' >>			% takt 40
  << g, d b >> d g, g g, d g, << g b >>	% takt 41
  g, g g, d e g g, << e c' >>			% takt 42
  << g, d b >> d g, g g, d g, << g b >>	% takt 43
  g, g g, d e g g, << e c' >>			% takt 44
  << g, d b >> d g, g g, d g, << g b >>	% takt 45
  g,1						% takt 46
  g,8 d g, g g, d g, g				% takt 47
  g, d g, g g, d g, g				% takt 48
  g, d g, g g, d g, g				% takt 49
  g, d g, g g, d g, g				% takt 50
  g, d g, g g, d g, g				% takt 51
  c g c g c g c g 				% takt 52
  c g c g c g c g				% takt 53
  c g c g c g c g				% takt 54
  c g c g c g c g				% takt 55
  g, d g, g g, d g, g				% takt 56
  g, g g, d e g g, e				% takt 57
  << g, d >> d g, g g, d g, g			% takt 58
  g, d g, g g, d g, g				% takt 59
  g, d g, g g, d g, g				% takt 60
  g, d g, g g, d g, g				% takt 61
  g, d g, g g, d g, g				% takt 62
  g, d g, g g, d g, g				% takt 63
  g, d g, g g, d g, g				% takt 64
  c g c g c g c g				% takt 65
  c g c g c g c g				% takt 66
  c g c g c g c g				% takt 67
  c g c g c g c g				% takt 68
  g, d g, g g, d g, g				% takt 69
  g, d g, d e g g, e				% takt 70
  d d g, g g, d g, g				% takt 71
  g, d g, g g, d g, g				% takt 72
  d a d a d a d a				% takt 73
  c g c g c g c g				% takt 74
  g, d g, g g, d g, g				% takt 75
  g, d g, g g, d g, g				% takt 76
  d a d a d a a, a				% takt 77
  c g c g c << g b >> c g			% takt 78
  g, d g, << g b >> g, d g, g			% takt 79
  c g c b c g c << g b >>			% takt 80
  d a d d' d a d a				% takt 81
  
  << g,2 b, d g b g' >> << fis, b, d g b fis' >>				% takt 82
  << e,8 b, e g b e' >> g e << b e' >> e << e, g >> << e b >> << e, e' >>	% takt 83
  e g e << b e' >> e g e << e, g b >>						% takt 84
  g, d g, g g, d g, g								% takt 85
  g, g g, d e g g, << e c' >>							% takt 86
  << g, d b >> d g, g g, d g, << g b >>					% takt 87
  g, g g, d e g g, << e c' >>							% takt 88
  << g, d b >> d g, g g, d g, << g b >>					% takt 89
  g, g g, d e g g, << e c' >>							% takt 90
  << g, d b >> d g, g g, d g, << g b >>					% takt 91
  

  % takt 92
  << g, b, d g b g' >> << g, b, d g b g' >> << g, b, d g b g' >> << g, b, d g b g' >> 
  << g, b, d g b g' >> << g, b, d g b g' >> << g, b, d g b g' >> << g, b, d g b g' >> 
  

  % takt 93
  << c4 e g c' e' >> << c8 e g c' e' >>
  
  \override TabNoteHead #'style = #'cross
    << d16 g b e' >> << d g b e' >>
  \revert TabNoteHead #'style
  << d4 fis g d' e' >> << d8 fis g d' e' >>
  
  \override TabNoteHead #'style = #'cross
    << a,16 d g b >> << a, d g b >>
  \revert TabNoteHead #'style
  
  
  % takt 94
  << e4 g g b e' >> << e8 g g b e' >>
  
  \override TabNoteHead #'style = #'cross
    << e,16 a, d >> << e, a, d >>
  \revert TabNoteHead #'style
  
  << c4 e g c' >> << c8 e g c' >>
  
  \override TabNoteHead #'style = #'cross
    << a,16 d g >> << a, d g >>
  \revert TabNoteHead #'style
  
  
  % takt 95
  << g,8 b, d g b g' >> << g,8 b, d g b g' >> << g,8 b, d g b g' >> << g,8 b, d g b g' >> 
  << g,8 b, d g b g' >> << g,8 b, d g b g' >> << g,8 b, d g b g' >> << g,8 b, d g b g' >> 
  
  
  % takt 96
  << g,8 b, d g b g' >> << g,8 b, d g b g' >> << g,8 b, d g b g' >> << g,8 b, d g b g' >> 
  << g,8 b, d g b g' >> << g,8 b, d g b g' >> << g,8 b, d g b g' >> << g,8 b, d g b g' >> 
  
  
  
  % takt 97
  << c4 e g c' e' >> << c8 e g c' e' >>
  
  \override TabNoteHead #'style = #'cross
    << d16 g b e' >> << d g b e' >>
  \revert TabNoteHead #'style
  << d4 fis g d' e' >> << d8 fis g d' e' >>
  
  \override TabNoteHead #'style = #'cross
    << a,16 d g b >> << a, d g b >>
  \revert TabNoteHead #'style
  
  
  % takt 98
  << e4 g g b e' >> << e8 g g b e' >>
  
  \override TabNoteHead #'style = #'cross
    << e,16 a, d >> << e, a, d >>
  \revert TabNoteHead #'style
  
  << c4 e g c' >> << c8 e g c' >>
  
  \override TabNoteHead #'style = #'cross
    << a,16 d g >> << a, d g >>
  \revert TabNoteHead #'style
  
  
  % takt 99
  << g,8 b, d g b g' >> << g,8 b, d g b g' >> << g,8 b, d g b g' >> << g,8 b, d g b g' >> 
  << g,8 b, d g b g' >> << g,8 b, d g b g' >> << g,8 b, d g b g' >> << g,8 b, d g b g' >> 
  
  
  % takt 100
  << g,8 b, d g b g' >> << g,8 b, d g b g' >> << g,8 b, d g b g' >> << g,8 b, d g b g' >> 
  << g,8 b, d g b g' >> << g,8 b, d g b g' >> << g,8 b, d g b g' >> << g,8 b, d g b g' >> 
  
  
  % takt 101
  << c4 e g c' e' >> << c8 e g c' e' >>
  
  \override TabNoteHead #'style = #'cross
    << d16 g b e' >> << d g b e' >>
  \revert TabNoteHead #'style
  << d4 fis g d' e' >> << d8 fis g d' e' >>
  
  \override TabNoteHead #'style = #'cross
    << a,16 d g b >> << a, d g b >>
  \revert TabNoteHead #'style
  
  
  % takt 102
  << e4 g g b e' >> << e8 g g b e' >>
  
  \override TabNoteHead #'style = #'cross
    << e,16 a, d >> << e, a, d >>
  \revert TabNoteHead #'style
  
  << c4 e g c' >> << c8 e g c' >>
  
  \override TabNoteHead #'style = #'cross
    << a,16 d g >> << a, d g >>
  \revert TabNoteHead #'style
  
  
  % takt 103
  << g,8 b, d g b g' >> << g,8 b, d g b g' >> << g,8 b, d g b g' >> << g,8 b, d g b g' >> 
  << g,8 b, d g b g' >> << g,8 b, d g b g' >> << g,8 b, d g b g' >> << g,8 b, d g b g' >> 
  
  
  % takt 104
  << g,8 b, d g b g' >> << g,8 b, d g b g' >> << g,8 b, d g b g' >> << g,8 b, d g b g' >> 
  << g,8 b, d g b g' >> << g,8 b, d g b g' >> << g,8 b, d g b g' >> << g,8 b, d g b g' >> 
  
  
  % takt 105
  << g,8 b, d g b g' >> << g,8 b, d g b g' >> << g,8 b, d g b g' >> << g,8 b, d g b g' >> 
  << g,8 b, d g b g' >> << g,8 b, d g b g' >> << g,8 b, d g b g' >> << g,8 b, d g b g' >> 
  
  % takt 106
  << g,1 b, d g b g' >>
  
  
  % takt 107
  r1
  
  
  % takt 108
  << g, b, d g b g' >>
  
  % ENDE
   \bar "|."
  
}

left = {
  \global
  \clef moderntab
  
  % Musik folgt hier.
  %\set PianoStaff.connectArpeggios = ##t
 
 
 
  
  
  g,8 d g, g g, d g, g				% takt 1
  g, d g, g g, d g, g				% takt 2
  g, d g, g g, d g, g				% takt 3
  g, d g, g g, d g, g				% takt 4
  g, d g, g g, d g, g				% takt 5
  c g c g c g c g 				% takt 6
  c g c g c g c g				% takt 7
  c g c g c g c g				% takt 8
  c g c g c g c g				% takt 9
  g, d g, g g, d g, g				% takt 10
  g, g g, d e g g, e				% takt 11
  << g, d >> d g, g g, d g, g			% takt 12
  g, d g, g g, d g, g				% takt 13
  g, d g, g g, d g, g				% takt 14
  g, d g, g g, d g, g				% takt 15
  g, d g, g g, d g, g				% takt 16
  g, d g, g g, d g, g				% takt 17
  g, d g, g g, d g, g				% takt 18
  c g c g c g c g				% takt 19
  c g c g c g c g				% takt 20
  c g c g c g c g				% takt 21
  c g c g c g c g				% takt 22
  g, d g, g g, d g, g				% takt 23
  g, d g, d e g g, e				% takt 24
  d d g, g g, d g, g				% takt 25
  g, d g, g g, d g, g				% takt 26
  d a d a d a d a				% takt 27
  c g c g c g c g				% takt 28
  g, d g, g g, d g, g				% takt 29
  g, d g, g g, d g, g				% takt 30
  d a d a d a a, a				% takt 31
  c g c g c << g b >> c g			% takt 32
  g, d g, << g b >> g, d g, g			% takt 33
  c g c b c g c << g b >>			% takt 34
  d a d d' d a d a				% takt 35
  g, g d g fis, g d g				% takt 36
  e, g e b e g << e b >> << e, e' >>		% takt 37
  e g e << b e' >> e g e << e, g b >>		% takt 38
  g, d g, g g, d g, g				% takt 39
  g, g g, d e g g, << e c' >>			% takt 40
  << g, d b >> d g, g g, d g, << g b >>	% takt 41
  g, g g, d e g g, << e c' >>			% takt 42
  << g, d b >> d g, g g, d g, << g b >>	% takt 43
  g, g g, d e g g, << e c' >>			% takt 44
  << g, d b >> d g, g g, d g, << g b >>	% takt 45
  g,1						% takt 46
  g,8 d g, g g, d g, g				% takt 47
  g, d g, g g, d g, g				% takt 48
  g, d g, g g, d g, g				% takt 49
  g, d g, g g, d g, g				% takt 50
  g, d g, g g, d g, g				% takt 51
  c g c g c g c g 				% takt 52
  c g c g c g c g				% takt 53
  c g c g c g c g				% takt 54
  c g c g c g c g				% takt 55
  g, d g, g g, d g, g				% takt 56
  g, g g, d e g g, e				% takt 57
  << g, d >> d g, g g, d g, g			% takt 58
  g, d g, g g, d g, g				% takt 59
  g, d g, g g, d g, g				% takt 60
  g, d g, g g, d g, g				% takt 61
  g, d g, g g, d g, g				% takt 62
  g, d g, g g, d g, g				% takt 63
  g, d g, g g, d g, g				% takt 64
  c g c g c g c g				% takt 65
  c g c g c g c g				% takt 66
  c g c g c g c g				% takt 67
  c g c g c g c g				% takt 68
  g, d g, g g, d g, g				% takt 69
  g, d g, d e g g, e				% takt 70
  d d g, g g, d g, g				% takt 71
  g, d g, g g, d g, g				% takt 72
  d a d a d a d a				% takt 73
  c g c g c g c g				% takt 74
  g, d g, g g, d g, g				% takt 75
  g, d g, g g, d g, g				% takt 76
  d a d a d a a, a				% takt 77
  c g c g c << g b >> c g			% takt 78
  g, d g, << g b >> g, d g, g			% takt 79
  c g c b c g c << g b >>			% takt 80
  d a d d' d a d a				% takt 81
  
  << g,2 b, d g b g' >> << fis, b, d g b fis' >>				% takt 82
  << e,8 b, e g b e' >> g e << b e' >> e << e, g >> << e b >> << e, e' >>	% takt 83
  e g e << b e' >> e g e << e, g b >>						% takt 84
  g, d g, g g, d g, g								% takt 85
  g, g g, d e g g, << e c' >>							% takt 86
  << g, d b >> d g, g g, d g, << g b >>					% takt 87
  g, g g, d e g g, << e c' >>							% takt 88
  << g, d b >> d g, g g, d g, << g b >>					% takt 89
  g, g g, d e g g, << e c' >>							% takt 90
  << g, d b >> d g, g g, d g, << g b >>					% takt 91
  

  % takt 92
  << g, b, d g b g' >> << g, b, d g b g' >> << g, b, d g b g' >> << g, b, d g b g' >> 
  << g, b, d g b g' >> << g, b, d g b g' >> << g, b, d g b g' >> << g, b, d g b g' >> 
  

  % takt 93
  << c4 e g c' e' >> << c8 e g c' e' >>
  
  \override TabNoteHead #'style = #'cross
    << d16 g b e' >> << d g b e' >>
  \revert TabNoteHead #'style
  << d4 fis g d' e' >> << d8 fis g d' e' >>
  
  \override TabNoteHead #'style = #'cross
    << a,16 d g b >> << a, d g b >>
  \revert TabNoteHead #'style
  
  
  % takt 94
  << e4 g g b e' >> << e8 g g b e' >>
  
  \override TabNoteHead #'style = #'cross
    << e,16 a, d >> << e, a, d >>
  \revert TabNoteHead #'style
  
  << c4 e g c' >> << c8 e g c' >>
  
  \override TabNoteHead #'style = #'cross
    << a,16 d g >> << a, d g >>
  \revert TabNoteHead #'style
  
  
  % takt 95
  << g,8 b, d g b g' >> << g,8 b, d g b g' >> << g,8 b, d g b g' >> << g,8 b, d g b g' >> 
  << g,8 b, d g b g' >> << g,8 b, d g b g' >> << g,8 b, d g b g' >> << g,8 b, d g b g' >> 
  
  
  % takt 96
  << g,8 b, d g b g' >> << g,8 b, d g b g' >> << g,8 b, d g b g' >> << g,8 b, d g b g' >> 
  << g,8 b, d g b g' >> << g,8 b, d g b g' >> << g,8 b, d g b g' >> << g,8 b, d g b g' >> 
  
  
  
  % takt 97
  << c4 e g c' e' >> << c8 e g c' e' >>
  
  \override TabNoteHead #'style = #'cross
    << d16 g b e' >> << d g b e' >>
  \revert TabNoteHead #'style
  << d4 fis g d' e' >> << d8 fis g d' e' >>
  
  \override TabNoteHead #'style = #'cross
    << a,16 d g b >> << a, d g b >>
  \revert TabNoteHead #'style
  
  
  % takt 98
  << e4 g g b e' >> << e8 g g b e' >>
  
  \override TabNoteHead #'style = #'cross
    << e,16 a, d >> << e, a, d >>
  \revert TabNoteHead #'style
  
  << c4 e g c' >> << c8 e g c' >>
  
  \override TabNoteHead #'style = #'cross
    << a,16 d g >> << a, d g >>
  \revert TabNoteHead #'style
  
  
  % takt 99
  << g,8 b, d g b g' >> << g,8 b, d g b g' >> << g,8 b, d g b g' >> << g,8 b, d g b g' >> 
  << g,8 b, d g b g' >> << g,8 b, d g b g' >> << g,8 b, d g b g' >> << g,8 b, d g b g' >> 
  
  
  % takt 100
  << g,8 b, d g b g' >> << g,8 b, d g b g' >> << g,8 b, d g b g' >> << g,8 b, d g b g' >> 
  << g,8 b, d g b g' >> << g,8 b, d g b g' >> << g,8 b, d g b g' >> << g,8 b, d g b g' >> 
  
  
  % takt 101
  << c4 e g c' e' >> << c8 e g c' e' >>
  
  \override TabNoteHead #'style = #'cross
    << d16 g b e' >> << d g b e' >>
  \revert TabNoteHead #'style
  << d4 fis g d' e' >> << d8 fis g d' e' >>
  
  \override TabNoteHead #'style = #'cross
    << a,16 d g b >> << a, d g b >>
  \revert TabNoteHead #'style
  
  
  % takt 102
  << e4 g g b e' >> << e8 g g b e' >>
  
  \override TabNoteHead #'style = #'cross
    << e,16 a, d >> << e, a, d >>
  \revert TabNoteHead #'style
  
  << c4 e g c' >> << c8 e g c' >>
  
  \override TabNoteHead #'style = #'cross
    << a,16 d g >> << a, d g >>
  \revert TabNoteHead #'style
  
  
  % takt 103
  << g,8 b, d g b g' >> << g,8 b, d g b g' >> << g,8 b, d g b g' >> << g,8 b, d g b g' >> 
  << g,8 b, d g b g' >> << g,8 b, d g b g' >> << g,8 b, d g b g' >> << g,8 b, d g b g' >> 
  
  
  % takt 104
  << g,8 b, d g b g' >> << g,8 b, d g b g' >> << g,8 b, d g b g' >> << g,8 b, d g b g' >> 
  << g,8 b, d g b g' >> << g,8 b, d g b g' >> << g,8 b, d g b g' >> << g,8 b, d g b g' >> 
  
  
  % takt 105
  << g,8 b, d g b g' >> << g,8 b, d g b g' >> << g,8 b, d g b g' >> << g,8 b, d g b g' >> 
  << g,8 b, d g b g' >> << g,8 b, d g b g' >> << g,8 b, d g b g' >> << g,8 b, d g b g' >> 
  
  % takt 106
  << g,1 b, d g b g' >>
  
  
  % takt 107
  r1
  
  
  % takt 108
  << g, b, d g b g' >>
  
  % ENDE
   \bar "|."
  
}


soloPart = \new GrandStaff <<
  \new Staff \with {
    midiInstrument = "violin"
    instrumentName = "1st Voice"
  } { \soprano }
  \addlyrics { \sopranoVerse }
>>


choirPart = \new ChoirStaff <<
  \new Staff \with {
    midiInstrument = "viola"
    instrumentName = "2nd Voice"
  } { \alto }
  \addlyrics { \altoVerse }
>>



guitarPart = \new TabStaff <<
  \new Staff \with {
    midiInstrument = "acoustic guitar (nylon)"
  } {\right}
  \new Staff \with {
    midiInstrument = "acoustic guitar (nylon)"
  } {\left}
>>





\score {
    <<
      \soloPart
      <<
        \new TabStaff {
          \tabFullNotation
          %\set Staff.stringTunings = \stringTuning <d, g, c f a d'> % wie zeigt man das dann an, dass die gitarre runtergestimmt werden muss?
          \set TabStaff.instrumentName = #"1st Guitar"
          \right
        }
      >>
      \choirPart
      <<
        \new TabStaff {
          \tabFullNotation
          %\set Staff.stringTunings = \stringTuning <d, g, c f a d'> % wie zeigt man das dann an, dass die gitarre runtergestimmt werden muss?
          \set TabStaff.instrumentName = #"2nd Guitar"
          \left
        }
      >>
    >>
    \layout { }
      \midi {
        \context {
          \Score
          tempoWholesPerMinute = #(ly:make-moment 111 4)
        }
    }
}

% MIDI-Dateien zum Proben:
\book {
  \bookOutputSuffix "soprano"
  \score {
    \rehearsalMidi "soprano" "soprano sax" \sopranoVerse
    \midi { }
  }
}

\book {
  \bookOutputSuffix "alto"
  \score {
    \rehearsalMidi "alto" "soprano sax" \altoVerse
    \midi { }
  }
}

\book {
  \bookOutputSuffix "1st_guitar"
  \score {
    \rehearsalMidi "right" "acoustic guitar (nylon)" \right
    \midi { }
  }
}

\book {
  \bookOutputSuffix "2st_guitar"
  \score {
    \rehearsalMidi "left" "acoustic guitar (nylon)" \left
    \midi { }
  }
}
