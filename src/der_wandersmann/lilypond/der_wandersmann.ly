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
    { <d,\5 fsharp,\4 a,\3 d\2>2 \deadNotesOn <d,\5 fsharp,\4 a,\3 d\2>2 \deadNotesOff }
    { <d,\5 fsharp,\4 a,\3 d\2>2 \deadNotesOn <d,\5 fsharp,\4 a,\3 d\2>2 \deadNotesOff }
  }

  % takt 9
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
}

voicePartGeleert = {
  % takt 9
  d''4 d''8 d''4. d''4

  % takt 10
  csharp'' b' a'4 r8 a'8

  % takt 11
  g''4 g''8 g''4 r8 g''4

  % takt 12
  fsharp'' e'' d'' r8 d''

  % takt 13
  g''4 g''8 a''4. g''4

  % takt 14
  fsharp''4 d''4 r2

  % takt 15
  csharp''4 a' b' csharp''

  % takt 16
  d''2
}

voicePartAnfang = {
  % takt 9
  d''4 d''8 d''4. d''4

  % takt 10
  csharp'' b' a'4 r4

  g''4 g''8 g''4. g''4

  % takt 12
  fsharp'' e''8 d''4 r4 d''8

  % takt 13
  g''4 g''8 a''4. g''4

  % takt 14
  fsharp''4  e''4 d''4 r8 d''8

  % takt 15
  csharp''4 a'8 b'4. csharp''4 d'' d'' d'' r
}

voicePart = {
  \repeat volta 2 {
    % takt 1 - 7
    r1 r r r r r r
  }
  % takt 8
  \alternative {
    { r1 }
    { r2 r4 a' }
  }

  \voicePartGeleert

  r4. a'8

  \voicePartAnfang
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

  Der Hirsch drohte zu ent -- kom -- men,
  doch rannte ich schnel -- ler als das Tier,
  mit blo -- ßer Faust nie -- der -- ge -- run -- gen;
  das Ge -- weih hier als Be -- weis da -- für!

  Der al -- te bärt -- ge Wan -- ders -- mann
  fängt mit der Ge -- schich -- te an,
  als einst ein Sturm das Meer zer -- wühlt
  und Mann und Maus vom Schiffs -- deck spült.

  Das Schiff droht -- e zu sin -- ken,
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
  und der De -- ckel auf der Hö -- lle blieb.

  Nun rollt das zwei -- te Fass her -- ein,
  wir wo -- llen nun -- mehr glück -- lich sein
  und nun nicht zu voll der Ran -- zen,
  fröh -- lich auf den Ti -- schen tan -- zen!

  Es fließt der Wein, es fließt das Bier!
  Hoch die Krü -- ge trin -- ken wir!
}

\score
{
  <<
    \new Staff
    <<
      \global
      \set Staff.midiInstrument = #"electric grand"
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
        \transpose d bflat
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
  }
}

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
      \set Staff.midiInstrument = #"oboe"
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

rehearsalMidi = #
(define-music-function
  (parser location name midiInstrument lyrics) (string? string? ly:music?)
    #{
   \unfoldRepeats <<
     \new Staff = "guitar" \new Voice = "guitar" { s1*0\f \guitarPartVoice }
     \new Staff = "voice" \new Voice = "voice" { s1*0\f \voicePart }
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

\book {
  \bookOutputSuffix "guitar"
  \score {
    \rehearsalMidi "guitar" "acoustic guitar (nylon)" \guitarPartVoice
    \midi { }
  }
}

