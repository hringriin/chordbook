% vim: ft=lilypond
\language "english"

\version "2.18.2"

%\layout {
%}

\header {
  title = "Der Wandersmann"
  composer = \markup { \bold {Music:} Schandmaul}
  arranger = \markup { \bold {Arrangement:} Joschka Köster}
  tagline = "Engraved with Lilypond - by Joschka Köster"
}

#(set-global-staff-size 22)
#(set-default-paper-size "a4landscape")

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
  <d,\5 fs\1>4 fs,4\4 a,4\3 d4\2
}

cFigureB = {
  <d,\5 fs\1>4 fs,8\4 a,8\3 d,8\5 d8\2 a,4\3
}

dFigureA = {
  <e,\4 g\1>4 b,8\3 e8\2 b,8\3 g8\1 e4\2
}

fFigureA = {
  < g,,\6 g\1 > g,8\4 b,\3 g,,\6 d\2 b,4\3
}

gFigureA = {
  <a,,\6 e\2>4 d4\2 cs4\2 a,4\3
}

gFigureB = {
  <a,,\6 e,\4 a,\3 cs\2>4 b,,4\5 cs,4\5 b,,4\5
}

gFigureC = {
  <a,,\6 a\1>4 e,8\4 a,8\3 a,,8\6 e8\2 a,4\3
}

aFigureA = {
  <b,,\5 fs\1>4 fs,4\4 b,4\3 d4\2
}

aFigureB = {
  <b,,\5 fs\1>4 fs,8\4 b,\3 b,,\5 d\2 b,4\3
}

% der hirsch drohte zu entkommen ...
% das schiff drohte zu sinken ...
verseEnd = {
  <e,\4 b,\3 e\2 g\1>2--
  <e,\4 d\3 g\2 as\1>2--
  \arpeggioArrowUp
  <e,\4 d\3 fs\2 b\1>2\arpeggio--
  \deadNotesOn
  <e,\4 b,\3 e\2 g\1>2--
  \deadNotesOff

  \cFigureB
  \gFigureC

  <e,\4 b,\3 e\2 g\1>2--
  <e,\4 d\3 g\2 as\1>2--
  \arpeggioArrowUp
  <a,\4 d\3 fs\2 b\1>2\arpeggio--
  \deadNotesOn
  <e,\4 b,\3 e\2 g\1>2--
  \deadNotesOff

  <d,\5 a,\3 d\2 fs\1>4 a,\3
  <a,,\6 a,\3 e\2 a\1>4 a,\3
  <b,,\5 fs\1>4 fs,4\4 b,4\3 cs4\2
}

guitarRollen = {
  g,,4\6 g,4\4 <b,\3 d\2 g\1>4 g,4\4
  fs,,4\6 fs,4\4 <a,\3 cs\2 fs\1> fs,4\4
  g,,4\6 g,4\4 <b,\3 d\2 g\1>4 g,4\4

  <d,\5 fs\1>4 a,4\3 a,,4\6 <a,\3 e\2 a\1>4

  g,,4\6 g,4\4 <b,\3 d\2 g\1>4 g,4\4
  fs,,4\6 fs,4\4 <a,\3 cs\2 fs\1> fs,4\4
  g,,4\6 g,4\4 <b,\3 d\2 g\1>4 g,4\4

  a,,4\6 a,4\4 <cs\3 e\2 a\1>4 a,4\4
}

guitarWine = {
  \repeat volta4
  {
    \cFigureB
    \gFigureC
  }
  \alternative
  {
    {
      < g,,\6 g\1 > g,8\4 b,\3 g,,\6 d\2 b,4\3
      < a,,\6 a\1 > a,8\4 cs\3 a,,\6 e\2 cs4\3
    }
    {
      g,,4\6 g,4\4 <b,\3 d\2 g\1>4 g,4\4
      a,,4\6 a,4\4 <cs\3 e\2 a\1>4 a,4\4

      d,8\5 fs,8\4 a,8\3 d8\2 fs8\1 d8\2 a,8\3 fs,8\4
      <fs,,\6 d,\5 fs,\4 a,\3 d\2>1\arpeggio\fermata
    }
  }
}

guitarPartVoice = {
  \set fingeringOrientations = #'(up)
  \mark "Capo 4"

  % takt 1 - 8
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
    { <d,\5 fs,\4 a,\3 d\2>2 \deadNotesOn <d,\5 fs,\4 a,\3 d\2>2 \deadNotesOff }
    { <d,\5 fs,\4 a,\3 d\2>2 \deadNotesOn <d,\5 fs,\4 a,\3 d\2>2 \deadNotesOff }
  }

  % takt 9
  % es ist geleert
  \cFigureB
  % das erste fass
  \gFigureC
  % bruederlein
  \dFigureA
  \aFigureB
  \dFigureA
  \cFigureB
  \gFigureC
  \cFigureA

  % takt 17
  % der alte
  \cFigureB
  \gFigureC
  \dFigureA
  \aFigureB
  \dFigureA
  \cFigureB
  \gFigureC
  \cFigureA

  \verseEnd

  % der alte
  \cFigureB
  \gFigureC
  \dFigureA
  \aFigureB
  \dFigureA
  \cFigureB
  \gFigureC
  \cFigureA

  \verseEnd

  % takt 9
  % es ist geleert
  \cFigureB
  % das erste fass
  \gFigureC
  % bruederlein
  \dFigureA
  \aFigureB
  \dFigureA
  \cFigureB
  \gFigureC
  \cFigureA

  % takt 17
  % der alte
  \cFigureB
  \gFigureC
  \dFigureA
  \aFigureB
  \dFigureA
  \cFigureB
  \gFigureC
  \cFigureA

  \verseEnd

  % der alte
  \cFigureB
  \gFigureC
  \dFigureA
  \aFigureB
  \dFigureA
  \cFigureB
  \gFigureC
  \cFigureA

  \verseEnd

  % takt 9
  % es ist geleert
  \cFigureB
  % das erste fass
  \gFigureC
  % bruederlein
  \dFigureA
  \aFigureB
  \dFigureA
  \cFigureB
  \gFigureC
  \cFigureA

  % takt 17
  % der alte
  \cFigureB
  \gFigureC
  \dFigureA
  \aFigureB
  \dFigureA
  \cFigureB
  \gFigureC
  \cFigureA

  \guitarRollen

  \guitarWine
}

voicePart = {
  \repeat volta 2 {
    % takt 1 - 7
    r1 r r r r r r
  }
  % takt 8
  \alternative {
    { r1 }
    { r2 r4 a }
  }

  % es ist geleert das erste Fass ...
  d'4 d'8 d'4. d'4
  cs' b8 a4. r8 a8
  g'4 g'8 g'4 r8 g'4
  fs' e' d' r8 d'
  g'4 g'8 a'4. g'4
  fs'4 d'4 r2
  cs'4 a b cs'
  d'2

  % auftakt: "Der [alte baertg'e]"
  r4. a8

  % alte baertg'e wandersmann ...
  d'4 d'8 d'4. d'4
  cs' b a4 r4
  % faengt mit der ...
  g'4 g'8 g'4. g'4
  fs' e'8 d'4 r4 d'8
  % einst von fern das jagdhorn
  g'4 g'8 a'4. g'4
  fs'4  e'4 d'4 r8 d'8
  % jaeger hetzten durch den wald
  cs'4 a8 b4. cs'4
  d' d' d' r8

  % der hirsch drohte zu entkom--
  e'8 g'4 g'8 g'8 g' g'4 fs'8
  % --men Doch ...
  fs'2 r4. fs'8
  % rannte ich schneller als
  fs'4 a' g'8 fs'4 e'8~
  % [als] das tier mit blosser
  e' cs'4 a fs'8 fs' fs'
  % faust nieder ge--
  g'2 g'8 g'4 g'8
  % --rungen ... Das Ge--
  fs'8 fs'4. r4 a8 a8
  % --weih hier als Be--
  d'4 fs' e'4. cs'8
  % --weis dafuer! Der [alte baert'ge ...]
  d'4 b b r8    a8

  % alte baertg'e wandersmann ...
  d'4 d'8 d'4. d'4
  cs' b a4 r4
  % faengt mit der ...
  g'4 g'8 g'4. g'4
  fs' e'8 d'4 r4 d'8

  % einst ein sturm das meer
  g'4 g'8 a'4. g'4
  fs'4  e'8 d'4 r8 d'4
  % mann und maus ...
  cs'8 a4 b4. cs'4
  % schiffs deck spuelt.
  d' d' d' r8

  % das schiff drohte zu sin--
  e'8 g'4 g' g'8 g'4 fs'8
  % --ken
  fs'2 r4. fs'8

  % die segel rissen wie [papier]
  fs'4 a' g'8 fs'4 e'8~
  % papier. Ich holte [Luft]
  e' cs'4 a fs'8 fs' fs'

  % Luft und bliess den
  g'4 g'4 g'4 g'4
  % Sturm fort Das
  fs'2 fs'4 r8 a8

  % Leinen als Be--
  d'4 fs' e'4. cs'8

  % --weis dafuer! Es [ist geleert ...]
  d'4 b b r8    a8

  % [es] ist geleert das erste Fass ...
  d'4 d'8 d'4. d'4
  cs' b8 a4. r8 a8
  g'4 g'8 g'4 r8 g'4
  fs' e' d' r8 d'
  g'4 g'8 a'4. g'4
  fs'4 d'4 r2
  cs'4 a b cs'
  d'2

  % auftakt: "Der [alte baertg'e]"
  r4. a8

  % alte baertg'e wandersmann ...
  d'4 d'8 d'4. d'4
  cs' b a4 r4
  % faengt mit der ...
  g'4 g'8 g'4. g'4
  fs' e'8 d'4 r4 d'8

  % einst der feind die stadt besetzt
  g'4 g'8 a'4. g'4
  fs'4  e'8 d'4 r8 d'4
  % das katapult
  cs'8 a4 b4. cs'4
  % das tor zerfetzt
  d' d' d' r4

  % ich schlich mich von
  g'4 g' g'4 g'4
  % hinten an
  fs'4 fs'8 fs'4 r4 fs'8

  % mein kampfschrei
  fs'4. a'4 g'8 fs'4
  % tausend mann. sie rannten ...
  e'4 cs'8 a r8 fs'8 fs' fs'

  % fort wie scheu's ge--
  g'4 g'8 g'4. g'4
  % tier. der
  fs'2 r4. a8

  % helm hier als Be--
  d'4 fs' e'4. cs'8

  % --weis dafuer! Der [alte baert'ge ...]
  d'4 b b r8    a8

  % alte baertg'e wandersmann ...
  d'4 d'8 d'4. d'4
  cs' b a4 r4
  % faengt mit der ...
  g'4 g'8 g'4. g'4
  fs' e'8 d'4 r4 d'8

  % einst der juengste tag anbrach
  g'4 g'8 a'4. g'4
  fs'4  e'4 d'4 r8 d'8
  % und alles von dem
  cs'8 a4 b4. cs'4
  % ende sprach
  d' d' d' r8

  % es leckten flammen in die welt als
  e'8 g'4 g' g'8 g'4.
   fs'4 fs'8 fs'4 r8 fs'4

  % offen stand die
  fs'8 a'4 g'4. fs'4
  % hoellentuer. ich schlug sie ...
  e'8 cs'4 a4 fs'8 fs' fs'

  % zu und mein schloss haelt
  g'4 g'8 g'4 g'4 fs'8~ fs'4. r2 a8

  % Schluessel als Be--
  d'8 fs'4 e'4. cs'4

  % --weis dafuer! Es [ist geleert ...]
  d'4 b b r8    a8

  % [es] ist geleert das erste Fass ...
  d'4 d'8 d'4. d'4
  cs' b8 a4. r8 a8
  g'4 g'8 g'4 g'8 fs'4~
  fs' e' d' r8 d'
  g'4 g'8 a'4. g'4
  fs'4 d'4 r2
  cs'4 a b cs'
  d'2

  % auftakt: "Ich [hab erzaehlt ...]"
  r4. a8

  % hab erzaehlt von
  d'4 d'8 d'4. d'4
  % meiner jagd, wie
  cs' b8 a4 r4 a8
  % ich den sturm bezwungen hab
  g'4 g'4 g'4 g'4
  fs'8 e'4 d'4 r4 d'8

  % wie den boesen
  g'4 g'4 a'4 g'4
  % feind vertrieb
  fs'4  e'4 d'4 d'8 d'8
  % deckel auf der
  cs'8 a4 b4. cs'4
  % hoelle blieb
  d'8 d'8 d'4 r4.

  % nun rollt ...
  fs'8 b'4 d'' cs'' a'
  % fass herein
  cs'' a' fs' r8 fs'
  % wollen nun mehr gluecklich sein
  g'8 b'4 a'4. g'4 fs' a' e' r4
  % und nun nicht zu
  r4 d''8 d'' d'' d''4.
  % voll der ranzen
  cs''4 a'4 fs'4 a'4
  % froehlich auf den
  r4 b'8 b' b'4 b'
  % tischen tanzen
  cs'' a' a'8 a'8 a'4

  \repeat volta 4 {
    % es fliesst der wein es
    a' a'8 a'4. a'4
    % fliesst das bier
    a' a'8 a'2 r8
  }
  \alternative{
    {
      % hoch die kruege
      b'4 d''8 d''4. d''4
      % trinken wir
      cs'' a' a'4. a'8
    }
    {
      % hoch die kruege
      %b'4^"ritardando _ _ _ _ _ _ _ _ _ _ _ _ _ _ _" d''4 d''4 d''4
      \override TextSpanner.bound-details.left.text = \markup { \upright "rit." }
      b'4\startTextSpan d''4 d''4 d''4
      % triiinnkeeeennn wiiiiiiiiiir :-)
      cs''4 (d'') e'' (d'')
      d''1\stopTextSpan~d''1\fermata
    }
  }
}

voiceLyrics = \lyricmode {
  Es ist ge -- leert das er -- ste Fass,
  kommt Brü -- der -- lein er -- zählt noch was
  von Eu -- ren wei -- ten Rei -- sen.
  Sprecht und hebt das Glas!

  Der al -- te bärt -- ge Wan -- ders -- mann
  fängt mit der Ge -- schich -- te an,
  als einst von fern das Jagd -- horn schallt
  und Jä -- ger hetz -- ten durch den Wald.

  Der Hirsch droh -- te zu ent -- kom -- men,
  doch rannte ich schnel -- ler als das Tier,
  mit blo -- ßer Faust nie -- der -- ge -- run -- gen;
  das Ge -- weih hier als Be -- weis da -- für!

  Der al -- te bärt -- ge Wan -- ders -- mann
  fängt mit der Ge -- schich -- te an,
  als einst ein Sturm das Meer zer -- wühlt
  und Mann und Maus vom Schiffs -- deck spült.

  Das Schiff droh -- te zu sin -- ken,
  die Se -- gel ris -- sen wie Pa -- pier.
  Ich hol -- te Luft und bließ den Sturm fort;
  das Lei -- nen als Be -- weis da -- für!

  Es ist ge -- leert das er -- ste Fass,
  kommt Brü -- der -- lein er -- zählt noch was
  von Eu -- ren wei -- ten Rei -- sen.
  Sprecht und hebt das Glas!

  Der al -- te bärt -- ge Wan -- ders -- mann
  fängt mit der Ge -- schich -- te an,
  als einst der Feind die Stadt be -- setzt,
  das Ka -- ta -- pult das Tor zer -- fetzt.

  Ich schlich mich von hin -- ten an,
  mein Kampf -- schrei klang wie tau -- send Mann.
  Sie rann -- ten fort wie scheu's Ge -- tier;
  der Helm hier als Be -- weis da -- für!

  Der al -- te bärt -- ge Wan -- ders -- mann
  fängt mit der Ge -- schich -- te an,
  als einst der jüng -- ste Tag an -- brach
  und a -- lles von dem En -- de sprach.

  Es leck -- ten Flam -- men in die Welt,
  als o -- ffen stand die Hö -- llen -- tür.
  Ich schlug sie zu und mein Schloß hält;
  der Schlü -- ssel als Be -- weis da -- für!

  Es ist ge -- leert das er -- ste Fass,
  kommt Brü -- der -- lein er -- zählt noch was
  von Eu -- ren wei -- ten Rei -- sen.
  Sprecht und hebt das Glas!

  Ich hab' er -- zählt von mein -- er Jagd,
  wie ich den Sturm be -- zwung -- en hab',
  wie ich den bö -- sen Feind ver -- trieb
  und der De -- ckel auf der Höl -- le blieb.

  Nun rollt das zwei -- te Fass her -- ein,
  wir wo -- llen nun -- mehr glück -- lich sein
  und nun nicht zu voll der Ran -- zen,
  fröh -- lich auf den Ti -- schen tan -- zen!

  Es fließt der Wein, es fließt das Bier!
  Hoch die Krü -- ge trin -- ken wir!

  Es

  Hoch die Krü -- ge trin __ ken __ wir!
}

% pdf
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
        \transpose d d'
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
        \transpose d bf
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

% midi
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

% rehearsal guitar
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

% rehearsal voice
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
