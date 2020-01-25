% vim: ft=lilypond:

\language "english"

\version "2.19.83"

% header {{{
% ----------------------------------------

\header {
  title = "Das Bier ich in der Rechten trug"
  composer = \markup { \bold {Music:} Versengold}
  arranger = \markup { \bold {Arrangement:} Joschka Köster}
  tagline = #(string-append "Engraved with LilyPond - by Joschka Köster (Build: " (strftime "%d.%m.%Y" (localtime (current-time))) ")" )
}

#(set-global-staff-size 22)
#(set-default-paper-size "a4landscape")

\paper {
  system-separator-markup = \slashSeparator
}

% ----------------------------------------
% header }}}
% guitar tuning {{{
% ----------------------------------------

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

% ----------------------------------------
% guitar tuning }}}
% global settings {{{
% ----------------------------------------

global = {
  \key d \major
  \numericTimeSignature

  \time 6/8
  \tempo 8 = 190

  \mergeDifferentlyDottedOn
  \mergeDifferentlyHeadedOn
}

% ----------------------------------------
% global settings }}}

% figures {{{
% ----------------------------------------

dFigureA = {
  <d\4 e'\1>16 (fs'\1) d'8\2 a\3 <fs'\1 d'\2> a\3 d\4
}

dFigureB = {
  d8\4 a\3 d'\2 fs'\1 d'\2 e'\1
  \tuplet 3/2 { <d\4 e'\1>16 (fs'\1 e'\1) } d'8\2 a\3 d'\2 g,\6 a,\5

}

aFigureA = {
  a,\5 e\4 a\3 <cs'\2 e'\1> a\3 d\4
}

gFigureA = {
  g,\6 d\4 g\3 <d'\2 g'\1> g\3 d\4
  g,\6 d16\4 (e\4) g8\3 <d'\2 g'\1> d'8\2 e'\1
}

gFigureB = {
  g,\6 d\4 g\3 <d'\2 g'\1> g\3 d\4
  g,\6 d\4 g\3 <d'\2 g'\1> d'8\2 e'\1
}

gaFigureA = {
  g,\6 d\4 <g\3 d'\2 g'\1> a,\5 e\4 <g\3 b\2>
}

intro = {
  \dFigureA
  \aFigureA
  \gFigureA
  \dFigureA
  \aFigureA
  \gaFigureA
  \dFigureB
}

refrain = {
  <g,\6 b,\5 d\4 g\3 d'\2 g'\1>8.
  <g,\6 b,\5 d\4 g\3 d'\2 g'\1>16
  <g,\6 b,\5 d\4 g\3 d'\2 g'\1>
  <g,\6 b,\5 d\4 g\3 d'\2 g'\1>
  <g,\6 b,\5 d\4 g\3 d'\2 g'\1>8.
  <g,\6 b,\5 d\4 g\3 d'\2 g'\1>16
  <g,\6 b,\5 d\4 g\3 d'\2 g'\1>
  <g,\6 b,\5 d\4 g\3 d'\2 g'\1>

  <a,\5 e\4 a\3 cs'\2 e'\1>8.
  <a,\5 e\4 a\3 cs'\2 e'\1>16
  <a,\5 e\4 a\3 cs'\2 e'\1>
  <a,\5 e\4 a\3 cs'\2 e'\1>
  <a,\5 e\4 a\3 cs'\2 e'\1>8.
  <a,\5 e\4 a\3 cs'\2 e'\1>16
  <a,\5 e\4 a\3 cs'\2 e'\1>
  <a,\5 e\4 a\3 cs'\2 e'\1>

  <d\4 a\3 d'\2 fs'\1>8.
  <d\4 a\3 d'\2 fs'\1>16
  <d\4 a\3 d'\2 fs'\1>
  <d\4 a\3 d'\2 fs'\1>
  <a,\5 e\4 a\3 cs'\2 e'\1>8.
  <a,\5 e\4 a\3 cs'\2 e'\1>16
  <a,\5 e\4 a\3 cs'\2 e'\1>
  <a,\5 e\4 a\3 cs'\2 e'\1>

  <b,\5 fs\4 b\3 d'\2 fs'\1>2.

  g,8\6 d\4 g\3 <d'\2 g'\1> g\3 d\4
  b,\5 fs\4 b\3 <d'\2 fs'\1> b\3 fs\4
  a,\5 e\4 <a\3 cs'\2>
  g,\6 d\4 <g\3 b\2>
  \dFigureB
}

vers = {
  \dFigureA
  \aFigureA
  \gFigureB
  \dFigureA
  \aFigureA
  \gFigureA

  \dFigureA
  \aFigureA
  \gFigureB
  \dFigureA
  \aFigureA
  \gaFigureA
  \dFigureB
}

refrainVerse = {
  % die
  r4 r r8 g8
  % welt sie hielt den
  b4 b8 b4 b8
  % atem an die
  b8 (a) a a (g) g
  % zeit stand stockend
  fs4 a8 fs e4
  % still ... und
  d4. r4 d8
  % ich ersann was
  g4 g8 g4 g8
  % ich noch retten
  fs4 e8 d8 fs4
  % kann und retten
  e4 e8 d b,4
  % will ...
  d4. r8 r4

}

% ----------------------------------------
% figures }}}
% guitarPart Voice {{{
% ----------------------------------------

guitarPartVoice = {
  \set fingeringOrientations = #'(up)
  \mark "Capo 2"

  % auftakt
  \partial 4 d'8\2 e'\1

  % takt 1
  \intro \bar "||" \break

  \vers
  \vers

  \refrain \bar "||" \break

  \vers
  \vers

  \refrain \bar "||" \break

  \vers
  \vers

  \refrain \bar "||" \break

  \vers
  \vers

  \refrain

  \arpeggioArrowUp
  <d\4 a\3 d'\2 e'\1>8\arpeggio (<d\4 a\3 d'\2 fs'\1>)~8~ 4.
  \bar "|."
}

% ----------------------------------------
% guitarPart voice }}}
% voicePart {{{
% ----------------------------------------

voicePart = {
  r4
  r2.
  r2.
  r2.
  r2.
  r2.
  r2.
  r2.
  r2.

  % VERS 1

  % ich ...
  r4 r r8 d8
  % schlenderte gemach
  fs4 fs8 fs4 fs8
  % versonnen
  fs (e) e e fs4
  % aus der schenken
  d4 d8 d4 b,8
  % tür ... mit
  d4. r4 fs8
  % armen voller
  a4 a8 a a4
  % freuden wonnen
  b4 a8 g fs4
  % lag die nacht vor
  g4 fs8 d4 b,8
  % mir ... in
  d4. r4 d8
  % meinem mund ein
  fs4 fs8 a4 fs8
  % peifchen hing im
  e4 e8 a4 e8
  % linken arm ein
  d4 d8 g4 d8
  % mägdlein ging in
  b,4 cs8 d4 d8
  % rechter hand ein
  fs4 fs8 a4 fs8
  % krug voll bier so
  e4 e8 a4 e8
  % wandelten hin-
  d4 b,8 cs4 e8
  % -aus wir vier
  e (d) cs d4 r8

  % doch ...
  r4 r r8 d8
  % als ich auf die
  fs4 fs8 fs4 fs8
  % Straße trat voll
  fs (e) e e4 fs8
  % frohgemut und
  d4 d8 d4 b,8
  % -sinn ... schritt
  d4. r4 r16 fs
  % ich in schlammig
  a16 a4~16 a8 a4
  % stadtunrat und
  b8 a g (fs4) fs8
  % schlitterte da-
  g8 fs8 d4. b,8
  % -hin ... der
  d4. r4 d8
  % untergrund ge-
  fs4 fs8 a4 fs8
  % -schwind entglitt im
  e4 e8 a4 e8
  % schwung nahm ich das
  d4 d8 g4 d8
  % mägdlein mit die
  b,4 cs8 d4 d8
  % mir im schreck und
  fs4 fs8 a4 fs8
  % ihrem flug das
  e4 e8 a4 e8
  % pfeifchen aus dem
  d4 b,8 cs4 e8
  % munde schlug
  e (d) cs d4 r8

  \refrainVerse

  % VERS 2

  % ich ...
  r4 r r8 d8
  % stützte mich mit
  fs4 fs8 fs4 fs8
  % linker Hand und
  fs (e) e e4 fs8
  % warf mich hoch em-
  d4 d8 d4 b,8
  % -por ... und
  d4. r4 fs8
  % zog dabei nicht
  a4 a8 a4 a8
  % grad galant am
  b4 a8 g (fs) fs
  % Haar das Mägdlein
  g4 fs8 d4 b,8
  % vor ... Ich
  d4. r4 d8
  % trat mit meinem
  fs4 fs8 a4 fs8
  % Fuß die Pfeif die
  e4 e8 a4 e8
  % flog in einnem
  d4 d8 g4 d8
  % Funkenreif hin
  b,4 cs8 d4 d8
  % hinweg der Magd die
  fs4 fs8 a4 fs8
  % grad nach vorn wie
  e4 e8 a4 e8
  % ich erneut den
  d4 b,8 cs4 e8
  % Halt verlor'n
  e (d) cs d4 r8

  % ich ...
  r4 r r8 d8
  % warf mich also
  fs4 fs8 fs4 fs8
  % auf den rücken
  fs (e) e e fs4
  % und mit linker
  d4 d8 d4 b,8
  % hand und knie tat
  d4 e8 d4 fs8
  % ich sie wuchtig
  a4 a8 a4 a8
  % von mir drücken
  b4 a8 g fs4
  % dass sie rittlings
  g4 fs8 d4 b,8
  % fiel und schrie grad
  d4 e8 d4 e8
  % noch erreichte
  fs4 fs8 a4 fs8
  % denn mein schuh das
  e4 e8 a4 e8
  % preifchen und ich
  d4 d8 g4 d8
  % trat schnell zu so
  b,4 cs8 d4 d8
  % sauste sie er-
  fs4 fs8 a4 fs8
  % -neut hin weg dem
  e4 e8 a4 e8
  % weib sich nähernd
  d4 b,8 cs4 e8
  % straßendreck
  e (d) cs d4 r8

  \refrainVerse

  % VERS 3

  % ich ...
  r4 r r8 d8
  % schwang mein ober-
  fs4 fs8 fs4 fs8
  % leib hinauf und
  fs (e) e e4 fs8
  % hielt und riss die
  d4 d8 d4 b,8
  % magd am kleid das
  d4 e8 d4 fs8
  % hat sie zwar nicht
  a4 a8 a4 a8
  % von dem sturz doch
  b4 a8 e4 fs8
  % von dem schnöden
  g4 fs8 d4 b,8
  % kleid befreit dann
  d4 e8 d4 e8
  % wollt ich dass mein
  fs4 fs8 a4 fs8
  % munde fing das
  e4 e8 a4 e8
  % pfeifchen das zu
  d4 d8 g4 d8
  % boden ging so
  b,4 cs8 d4 d8
  % beugte ich mein
  fs4 fs8 a4 fs8
  % kreuze krum und
  e4 e8 a4 e8
  % fing es zwar doch
  d16 b,8 d4.. e8
  % falsch herum
  e (d) cs d4 r8

  % voll ...
  r4 r r8 d8
  % schmerz gepeint spie
  fs4 fs8 fs4 fs8
  % ich die glut im
  fs4 e8 e4 fs8
  % allzuweiten
  d4 d8 d4 b,8
  % bogen aus und
  d4 e8 d4 fs8
  % streckte mich voll
  a4 a8 a4 a8
  % übermut mit
  b4 a8 e4 fs8
  % letzter kraft in
  g4 fs8 d4 b,8
  % saus und braus in
  d4 e8 d4 e8
  % richtung magd die
  fs4 fs8 a4 fs8
  % leuchtend gar mit
  e4 e8 a4 cs'8
  % meiner funken-
  d'4 cs'8 b (a) a
  % -glut im haar trotz
  b4 a8 a4 e8
  % all der müh' die
  fs4 fs8 a4 fs8
  % ich mir gab fiel
  e4 e8 a4 e8
  % klatschend in den
  d8 b,4 r8 cs8 e8
  % stadtunrat
  e16 d8 d4.. r8

  \refrainVerse

  % VERS 4

  % so ...
  r4 r r8 d8
  % stand ich denn be-
  fs4 fs8 fs4 fs8
  % -treten da von schlamm
  fs4 e8 e4 fs8
  % und matsch be-
  d4 d8 d4 b,8
  % -netzt be-
  d4. r4 fs8
  % -sudelt sinkend
  a8 a4 a4 a8
  % muffig gar vom
  b8 a8 g8 (fs4) fs8
  % straßendreck durch-
  g4 fs8 d4 b,8
  % -setzt vor
  d4 r4. e8
  % einer magd die
  fs4 fs8 a4 fs8
  % halbnackt war mich
  e4 e8 a4 e8
  % schmorend und ver-
  d4 d8 g4 d8
  % -letzt besah und
  b,4 cs8 d4 e8
  % trotzig sich denn
  fs4 fs8 a4 fs8
  % abgewandt ist
  e4 e8 a4 e8
  % schluchzend sie nach
  d4 b,8 cs4 e8
  % haus gerannt
  e (d) cs d4 r8

  r4. r4.
  % auch mein guter
  fs4 fs8 fs4 fs8
  % tabak war in
  fs8 e e4. fs8
  % aller welt ver-
  d16 d8 d4.. b,8
  % -streut mein
  d4. r4 fs8
  % guter edler
  a4 a8 a4 a8
  % tabak den ge-
  b8 a g (fs4) fs8
  % -nießen wollt ich
  g4 fs8 d4 b,8
  % heut da-
  d4. r4 e8
  % -hin war die er-
  fs4 fs8 a4 fs8
  % -hoffte nacht so
  e4 e8 a4 e8
  % hab ich mich denn
  d4 d8 g4 d8
  % heim gemacht und
  b,4 cs8 d4 d8
  % trank frustriert in
  fs4 fs8 a4 fs8
  % einem zug das
  e4 e8 a4 e8
  % bier ich in der
  d4 b,8 cs4 e8
  % rechten trug
  e (d) cs d4 r8

  \refrainVerse

  r4. r4.
  r4. r4.
}

% ----------------------------------------
% voicePart }}}
% lyrics {{{
% ----------------------------------------

voiceLyrics = \lyricmode {
  Ich schlen -- der -- te ge -- mach, ver -- son -- nen aus der Schen -- ken -- tür.
  Mit Ar -- men vol -- ler Freu -- den -- won -- nen lag die Nacht vor mir.
  In mei -- nem Mund ein Pfeif -- chen hing, im lin -- ken Arm ein Mägd -- lein ging,
  in rech -- ter Hand ein Krug voll Bier, so wan -- del -- ten hin -- aus wir vier.

  Doch als ich auf die Stra -- ße trat, voll Froh -- ge -- mut und -sinn,
  schritt ich in schlam -- mig Stadt -- un -- rat und schlit -- ter -- te da -- hin.
  Der Un -- ter -- grund ge -- schwind ent -- glitt, im Schwung nahm ich das Mägd -- lein mit,
  die mir im Schreck und ih -- rem Flug das Pfeif -- chen aus dem Mun -- de schlug.

  Die Welt sie hielt den A -- tem an, die Zeit stand sto -- ckend still
  und ich er -- sann, was ich noch ret -- ten kann und ret -- ten will.

  Ich stütz -- te mich mit lin -- ker Hand und warf mich hoch em -- por
  und zog da -- bei nicht grad ga -- lant am Haar das Mägd -- lein vor.
  Dann trat ich mit dem Fuß die Pfeif, die flog in ei -- nem Fun -- ken -- reif
  hin -- weg der Magd, die grad nach vorn, wie ich er -- neut den Halt ver -- lor'n.
  Ich warf mich al -- so auf den Rü -- cken und mit lin -- ker Hand und Knie
  tat ich sie wuch -- tig von mir drü -- cken, dass sie ritt -- lings fiel und schrie.
  Grad noch er -- reich -- te denn mein Schuh das Pfeif -- chen und ich trat schnell zu,
  so sau -- ste sie er -- neut hin -- weg, dem Weib sich nä -- hernd Stra -- ßen -- dreck.

  Die Welt sie hielt den A -- tem an, die Zeit stand sto -- ckend still
  und ich er -- sann, was ich noch ret -- ten kann und ret -- ten will.

  Ich schwang mein' O -- ber -- leib hi -- nauf und hielt und riss die Magd am Kleid,
  das hat sie zwar nicht von dem Sturz, doch von dem schnö -- den Kleid be -- freit.
  Dann wollt' ich, dass mein Mun -- de fing das Pfeif -- chen, das zu Bo -- den ging.
  So beug -- te ich mein Kreu -- ze krum und fing es zwar doch falsch her -- um.

  Voll Schmerz ge -- peint spie ich die Glut im all -- zu -- wei -- ten Bo -- gen aus
  und streck -- te mich voll Ü -- ber -- mut mit letz -- ter Kraft in Saus und Braus
  in Rich -- tung Magd, die leuch -- tend gar, mit mei -- ner Fun -- ken -- glut im Haar
  trotz all der Müh', die ich mir gab, fiel kla -- tschend in den Stadt -- un -- rat.

  Die Welt sie hielt den A -- tem an, die Zeit stand sto -- ckend still
  und ich er -- sann, was ich noch ret -- ten kann und ret -- ten will.

  So stand ich denn be -- tre -- ten da, von Schlamm und Matsch be -- netzt.
  Be -- su -- delt, stin -- kend, mu -- ffig gar, vom Stra -- ßen -- dreck durch -- setzt.
  Vor ei -- ner Magd, die halb -- nackt war, mich schmo -- rend und ver -- letzt be -- sah
  und tro -- tzig sich denn ab -- ge -- wandt, ist schluch -- zend sie nach Haus ge -- rannt.

  Auch mein gu -- ter Ta -- bak war in al -- ler Welt ver -- streut.
  Mein gu -- ter, ed -- ler Ta -- bak den ge -- nie -- ßen wollt' ich heut'.
  Da -- hin war die er -- hoff -- te Nacht, so hab ich mich denn heim -- ge -- macht
  und trank frus -- triert in ei -- nem Zug das Bier ich in der Rech -- ten trug.

  Die Welt sie hielt den A -- tem an, die Zeit stand sto -- ckend still
  und ich er -- sann, was ich noch ret -- ten kann und ret -- ten will.
}

% ----------------------------------------
% lyrics }}}

% pdf {{{
% ----------------------------------------

\score
{
  <<
    \new Staff
    <<
      \global
      \transpose d d'
      {
        \voicePart
      }
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
        \transpose d d
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
        \transpose d c
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
    \override LyricSpace.minimum-distance = #3.0
  }
}

% ----------------------------------------
% pdf }}}
% midi {{{
% ----------------------------------------

\score
{
  \unfoldRepeats
  <<
    \context TabStaff = guitar
    {
      \set Staff.midiInstrument = #"acoustic guitar (nylon)"
      \transpose d d
      {
        \guitarPartVoice
      }
    }

    \context Staff = thevoice
    {
      \set Staff.midiInstrument = #"bright acoustic"
      \transpose d d
      {
        \voicePart
      }
    }
  >>

  \midi
  {
    \tempo 8 = 190
  }
}


% rehearsal guitar {{{
% ----------------------------------------

\book {
  \bookOutputSuffix "guitar"
  \score
  {
    \unfoldRepeats
    <<
      \context TabStaff = guitar
      {
        \set Score.midiMinimumVolume = #0.4
        \set Score.midiMaximumVolume = #0.4
        \set Staff.midiMinimumVolume = #0.8
        \set Staff.midiMaximumVolume = #1.0
        \set Staff.midiInstrument = #"acoustic guitar (nylon)"
        \transpose d d
        {
          \guitarPartVoice
        }
      }

      \context Staff = thevoice
      {
        \set Staff.midiInstrument = #"bright acoustic"
        \transpose d d
        {
          \voicePart
        }
      }
    >>

    \midi
    {
      \tempo 8 = 140
    }
  }
}

% ----------------------------------------
% rehearsal guitar }}}
% rehearsal voice {{{
% ----------------------------------------

\book {
  \bookOutputSuffix "voice"
  \score
  {
    \unfoldRepeats
    <<
      \context TabStaff = guitar
      {
        \set Staff.midiInstrument = #"acoustic guitar (nylon)"
        \transpose d d
        {
          \guitarPartVoice
        }
      }

      \context Staff = thevoice
      {
        \set Score.midiMinimumVolume = #0.4
        \set Score.midiMaximumVolume = #0.4
        \set Staff.midiMinimumVolume = #0.8
        \set Staff.midiMaximumVolume = #1.0
        \set Staff.midiInstrument = #"bright acoustic"
        \transpose d d
        {
          \voicePart
        }
      }
    >>

    \midi
    {
      \tempo 8 = 140
    }
  }
}

% ----------------------------------------
% rehearsal Voice }}}

% ----------------------------------------
% midi }}}
