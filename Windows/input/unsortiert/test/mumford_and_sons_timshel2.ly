#(define (tie::tab-clear-tied-fret-numbers grob)

   (let* ((tied-fret-nr (ly:spanner-bound grob RIGHT)))

      (ly:grob-set-property! tied-fret-nr 'transparent #t)))


\version "2.14.0"

\paper {

   indent = #30

   print-all-headers = ##t
   print-all-headers = ##t

   ragged-right = ##f

   ragged-bottom = ##t

}

\layout {

   \context { \Score

      \override MetronomeMark #'padding = #'5

   }

   \context { \Staff

      \override TimeSignature #'style = #'numbered

      \override StringNumber #'transparent = ##t

   }

   \context { \TabStaff

      \override TimeSignature #'style = #'numbered

      \override Stem #'transparent = ##t

      \override Beam #'transparent = ##t

      \override Tie  #'after-line-breaking = #tie::tab-clear-tied-fret-numbers

   }

   \context { \TabVoice

      \override Tie #'stencil = ##f

   }

   \context { \StaffGroup

      \consists "Instrument_name_engraver"

   }

}

deadNote = #(define-music-function (parser location note) (ly:music?)

   (set! (ly:music-property note 'tweaks)

      (acons 'stencil ly:note-head::print

         (acons 'glyph-name "2cross"

            (acons 'style 'special

               (ly:music-property note 'tweaks)))))

   note)


palmMute = #(define-music-function (parser location note) (ly:music?)

   (set! (ly:music-property note 'tweaks)

      (acons 'style 'do (ly:music-property note 'tweaks)))

   note)


TrackAVoiceAMusic = #(define-music-function (parser location inTab) (boolean?)

#{

   \tempo 4=155

   \clef #(if $inTab "tab" "treble_8")

   \key g \major

   \time 4/4

   \oneVoice
   
   <g,\6>8 <d\4>8 <g,\6>8 <g\3>8 <g,\6>8 <d\4>8 <g,\6>8 <g\3>8 
   <g,\6>8 <d\4>8 <g,\6>8 <g\3>8 <g,\6>8 <d\4>8 <g,\6>8 <g\3>8 
   <g,\6>8 <d\4>8 <g,\6>8 <g\3>8 <g,\6>8 <d\4>8 <g,\6>8 <g\3>8 
   <g,\6>8 <d\4>8 <g,\6>8 <g\3>8 <g,\6>8 <d\4>8 <g,\6>8 <g\3>8 
   <g,\6>8 <d\4>8 <g,\6>8 <g\3>8 <g,\6>8 <d\4>8 <g,\6>8 <g\3>8 
   <c\5>8 <g\3>8 <c\5>8 <g\3>8 <c\5>8 <g\3>8 <c\5>8 <g\3>8 
   <c\5>8 <g\3>8 <c\5>8 <g\3>8 <c\5>8 <g\3>8 <c\5>8 <g\3>8 
   <c\5>8 <g\3>8 <c\5>8 <g\3>8 <c\5>8 <g\3>8 <c\5>8 <g\3>8 
   <c\5>8 <g\3>8 <c\5>8 <g\3>8 <c\5>8 <g\3>8 <c\5>8 <g\3>8 
   <g,\6>8 <d\4>8 <g,\6>8 <g\3>8 <g,\6>8 <d\4>8 <g,\6>8 <g\3>8 

   <g,~\6>8 <g\3>8 <g,\6>8 <d\4>8 <e\4>8 <g\3>8 <g,\6>8 <e\4>8 
   <d\4 g,\6 >8 <d\4>8 <g,\6>8 <g\3>8 <g,\6>8 <d\4>8 <g,\6>8 <g\3>8 
   <g,\6>8 <d\4>8 <g,\6>8 <g\3>8 <g,\6>8 <d\4>8 <g,\6>8 <g\3>8 
   <g,\6>8 <d\4>8 <g,\6>8 <g\3>8 <g,\6>8 <d\4>8 <g,\6>8 <g\3>8 
   <g,\6>8 <d\4>8 <g,\6>8 <g\3>8 <g,\6>8 <d\4>8 <g,\6>8 <g\3>8 
   <g,\6>8 <d\4>8 <g,\6>8 <g\3>8 <g,\6>8 <d\4>8 <g,\6>8 <g\3>8 
   <g,\6>8 <d\4>8 <g,\6>8 <g\3>8 <g,\6>8 <d\4>8 <g,\6>8 <g\3>8 
   <g,\6>8 <d\4>8 <g,\6>8 <g\3>8 <g,\6>8 <d\4>8 <g,\6>8 <g\3>8 
   <c\5>8 <g\3>8 <c\5>8 <g\3>8 <c\5>8 <g\3>8 <c\5>8 <g\3>8 
   <c\5>8 <g\3>8 <c\5>8 <g\3>8 <c\5>8 <g\3>8 <c\5>8 <g\3>8 
   <c\5>8 <g\3>8 <c\5>8 <g\3>8 <c\5>8 <g\3>8 <c\5>8 <g\3>8 
   <c\5>8 <g\3>8 <c\5>8 <g\3>8 <c\5>8 <g\3>8 <c\5>8 <g\3>8 
   <g,\6>8 <d\4>8 <g,\6>8 <g\3>8 <g,\6>8 <d\4>8 <g,\6>8 <g\3>8 
   <g,\6>8 <d\4>8 <g,\6>8 <d\4>8 <e\4>8 <g\3>8 <g,\6>8 <e\4>8 
   <d\4>8 <d\4>8 <g,\6>8 <g\3>8 <g,\6>8 <d\4>8 <g,\6>8 <g\3>8 
   <g,\6>8 <d\4>8 <g,\6>8 <g\3>8 <g,\6>8 <d\4>8 <g,\6>8 <g\3>8 
   <d\4>8 <a\3>8 <d\4>8 <a\3>8 <d\4>8 <a\3>8 <d\4>8 <a\3>8 
   <c\5>8 <g\3>8 <c\5>8 <g\3>8 <c\5>8 <g\3>8 <c\5>8 <g\3>8 
   <g,\6>8 <d\4>8 <g,\6>8 <g\3>8 <g,\6>8 <d\4>8 <g,\6>8 <g\3>8 
   <g,\6>8 <d\4>8 <g,\6>8 <g\3>8 <g,\6>8 <d\4>8 <g,\6>8 <g\3>8 
   <d\4>8 <a\3>8 <d\4>8 <a\3>8 <d\4>8 <a\3>8 <a,\5>8 <a\3>8 

   <c\5>8 <g\3>8 <c\5>8 <g\3>8 <c\5>8 <b~\2 g\3 >8 <c\5>8 <g\3>8 
   <g,\6>8 <d\4>8 <g,\6>8 <b\2 g\3 >8 <g,\6>8 <d\4>8 <g,\6>8 <g\3>8 

   <c\5>8 <g\3>8 <c\5>8 <b~\2>8 <c\5>8 <g\3>8 <c\5>8 <b\2 g\3 >8 
   <d\4>8 <a\3>8 <d\4>8 <d'\2>8 <d\4>8 <a\3>8 <d\4>8 <a\3>8 

   <g,\6>8 <g\3>8 <d\4>8 <g\3>8 <fis,\6>8 <g\3>8 <d\4>8 <g\3>8 

   <e,~\6>8 <g\3>8 <e\4>8 <b~\2>8 <e\4>8 <g\3>8 <b\2 e\4 >8 <e'~\1 e,~\6 >8 

   <e\4>8 <g\3>8 <e\4>8 <e'\1 b~\2 >8 <e\4>8 <g\3>8 <e\4>8 <b\2 g\3 e,\6 >8 
   <g,\6>8 <d\4>8 <g,\6>8 <g\3>8 <g,\6>8 <d\4>8 <g,\6>8 <g\3>8 

   <g,~\6>8 <g\3>8 <g,\6>8 <d\4>8 <e\4>8 <g\3>8 <g,\6>8 <c'\2 e\4 >8 

   <b~\2 d\4 g,\6 >8 <d\4>8 <g,\6>8 <g\3>8 <g,\6>8 <d\4>8 <g,\6>8 <b\2 g\3 >8 

   <g,~\6>8 <g\3>8 <g,\6>8 <d\4>8 <e\4>8 <g\3>8 <g,\6>8 <c'\2 e\4 >8 

   <b~\2 d\4 g,\6 >8 <d\4>8 <g,\6>8 <g\3>8 <g,\6>8 <d\4>8 <g,\6>8 <b\2 g\3 >8 

   <g,~\6>8 <g\3>8 <g,\6>8 <d\4>8 <e\4>8 <g\3>8 <g,\6>8 <c'\2 e\4 >8 

   <b~\2 d\4 g,\6 >8 <d\4>8 <g,\6>8 <g\3>8 <g,\6>8 <d\4>8 <g,\6>8 <b\2 g\3 >8 
   <g,\6>1 
   <g,\6>8 <d\4>8 <g,\6>8 <g\3>8 <g,\6>8 <d\4>8 <g,\6>8 <g\3>8 
   <g,\6>8 <d\4>8 <g,\6>8 <g\3>8 <g,\6>8 <d\4>8 <g,\6>8 <g\3>8 
   <g,\6>8 <d\4>8 <g,\6>8 <g\3>8 <g,\6>8 <d\4>8 <g,\6>8 <g\3>8 
   <g,\6>8 <d\4>8 <g,\6>8 <g\3>8 <g,\6>8 <d\4>8 <g,\6>8 <g\3>8 
   <g,\6>8 <d\4>8 <g,\6>8 <g\3>8 <g,\6>8 <d\4>8 <g,\6>8 <g\3>8 
   <c\5>8 <g\3>8 <c\5>8 <g\3>8 <c\5>8 <g\3>8 <c\5>8 <g\3>8 
   <c\5>8 <g\3>8 <c\5>8 <g\3>8 <c\5>8 <g\3>8 <c\5>8 <g\3>8 
   <c\5>8 <g\3>8 <c\5>8 <g\3>8 <c\5>8 <g\3>8 <c\5>8 <g\3>8 
   <c\5>8 <g\3>8 <c\5>8 <g\3>8 <c\5>8 <g\3>8 <c\5>8 <g\3>8 
   <g,\6>8 <d\4>8 <g,\6>8 <g\3>8 <g,\6>8 <d\4>8 <g,\6>8 <g\3>8 

   <g,~\6>8 <g\3>8 <g,\6>8 <d\4>8 <e\4>8 <g\3>8 <g,\6>8 <e\4>8 
   <d\4 g,\6 >8 <d\4>8 <g,\6>8 <g\3>8 <g,\6>8 <d\4>8 <g,\6>8 <g\3>8 
   <g,\6>8 <d\4>8 <g,\6>8 <g\3>8 <g,\6>8 <d\4>8 <g,\6>8 <g\3>8 
   <g,\6>8 <d\4>8 <g,\6>8 <g\3>8 <g,\6>8 <d\4>8 <g,\6>8 <g\3>8 
   <g,\6>8 <d\4>8 <g,\6>8 <g\3>8 <g,\6>8 <d\4>8 <g,\6>8 <g\3>8 
   <g,\6>8 <d\4>8 <g,\6>8 <g\3>8 <g,\6>8 <d\4>8 <g,\6>8 <g\3>8 
   <g,\6>8 <d\4>8 <g,\6>8 <g\3>8 <g,\6>8 <d\4>8 <g,\6>8 <g\3>8 
   <g,\6>8 <d\4>8 <g,\6>8 <g\3>8 <g,\6>8 <d\4>8 <g,\6>8 <g\3>8 
   <c\5>8 <g\3>8 <c\5>8 <g\3>8 <c\5>8 <g\3>8 <c\5>8 <g\3>8 
   <c\5>8 <g\3>8 <c\5>8 <g\3>8 <c\5>8 <g\3>8 <c\5>8 <g\3>8 
   <c\5>8 <g\3>8 <c\5>8 <g\3>8 <c\5>8 <g\3>8 <c\5>8 <g\3>8 
   <c\5>8 <g\3>8 <c\5>8 <g\3>8 <c\5>8 <g\3>8 <c\5>8 <g\3>8 
   <g,\6>8 <d\4>8 <g,\6>8 <g\3>8 <g,\6>8 <d\4>8 <g,\6>8 <g\3>8 
   <g,\6>8 <d\4>8 <g,\6>8 <d\4>8 <e\4>8 <g\3>8 <g,\6>8 <e\4>8 
   <d\4>8 <g\3>8 <g,\6>8 <g\3>8 <g,\6>8 <g\3>8 <g,\6>8 <d\4>8 
   <g,\6>8 <d\4>8 <g,\6>8 <g\3>8 <g,\6>8 <d\4>8 <g,\6>8 <g\3>8 
   <d\4>8 <a\3>8 <d\4>8 <a\3>8 <d\4>8 <a\3>8 <d\4>8 <a\3>8 
   <c\5>8 <g\3>8 <c\5>8 <g\3>8 <c\5>8 <g\3>8 <c\5>8 <g\3>8 
   <g,\6>8 <d\4>8 <g,\6>8 <g\3>8 <g,\6>8 <d\4>8 <g,\6>8 <g\3>8 
   <g,\6>8 <d\4>8 <g,\6>8 <g\3>8 <g,\6>8 <d\4>8 <g,\6>8 <g\3>8 
   <d\4>8 <a\3>8 <d\4>8 <a\3>8 <d\4>8 <a\3>8 <a,\5>8 <a\3>8 

   <c\5>8 <g\3>8 <c\5>8 <g\3>8 <c\5>8 <b~\2 g\3 >8 <c\5>8 <g\3>8 
   <g,\6>8 <d\4>8 <g,\6>8 <b\2 g\3 >8 <g,\6>8 <d\4>8 <g,\6>8 <g\3>8 

   <c\5>8 <g\3>8 <c\5>8 <b~\2>8 <c\5>8 <g\3>8 <c\5>8 <b\2 g\3 >8 
   <d\4>8 <a\3>8 <d\4>8 <d'\2>8 <d\4>8 <a\3>8 <d\4>8 <a\3>8 

   <g'\1 b\2 g\3 d\4 b,\5 g,\6 >2 <fis'\1 b\2 g\3 d\4 b,\5 fis,\6 >2 

   <e'~\1 b\2 g\3 e\4 b,\5 e,~\6 >8 <g\3>8 <e\4>8 <e'\1 b~\2 >8 <e\4>8 <g\3 e,~\6 >8 <b\2 e\4 >8 <e'~\1 e,~\6 >8 

   <e\4>8 <g\3>8 <e\4>8 <e'\1 b~\2 >8 <e\4>8 <g\3>8 <e\4>8 <b\2 g\3 e,\6 >8 
   <g,\6>8 <d\4>8 <g,\6>8 <g\3>8 <g,\6>8 <d\4>8 <g,\6>8 <g\3>8 

   <g,~\6>8 <g\3>8 <g,\6>8 <d\4>8 <e\4>8 <g\3>8 <g,\6>8 <c'\2 e\4 >8 

   <b~\2 d\4 g,\6 >8 <d\4>8 <g,\6>8 <g\3>8 <g,\6>8 <d\4>8 <g,\6>8 <b\2 g\3 >8 

   <g,~\6>8 <g\3>8 <g,\6>8 <d\4>8 <e\4>8 <g\3>8 <g,\6>8 <c'\2 e\4 >8 

   <b~\2 d\4 g,\6 >8 <d\4>8 <g,\6>8 <g\3>8 <g,\6>8 <d\4>8 <g,\6>8 <b\2 g\3 >8 

   <g,~\6>8 <g\3>8 <g,\6>8 <d\4>8 <e\4>8 <g\3>8 <g,\6>8 <c'\2 e\4 >8 

   <b~\2 d\4 g,\6 >8 <d\4>8 <g,\6>8 <g\3>8 <g,\6>8 <d\4>8 <g,\6>8 <b\2 g\3 >8 
   <g'\1 b\2 g\3 d\4 b,\5 g,\6 >8 <g'\1 b\2 g\3 d\4 b,\5 g,\6 >8 <g'\1 b\2 g\3 d\4 b,\5 g,\6 >8 <g'\1 b\2 g\3 d\4 b,\5 g,\6 >8 <g'\1 b\2 g\3 d\4 b,\5 g,\6 >8 <g'\1 b\2 g\3 d\4 b,\5 g,\6 >8 <g'\1 b\2 g\3 d\4 b,\5 g,\6 >8 <g'\1 b\2 g\3 d\4 b,\5 g,\6 >8 

   <e'\1 c'\2 g\3 e\4 c\5 >4 <e'\1 c'\2 g\3 e\4 c\5 >8 <\deadNote e'\1 \deadNote b\2 \deadNote g\3 \deadNote d\4 >16 <\deadNote e'\1 \deadNote b\2 \deadNote g\3 \deadNote d\4 >16 <e'\1 d'\2 g\3 fis\4 d\5 >4 <e'\1 d'\2 g\3 fis\4 d\5 >8 <\deadNote b\2 \deadNote g\3 \deadNote d\4 \deadNote a,\5 >16 <\deadNote b\2 \deadNote g\3 \deadNote d\4 \deadNote a,\5 >16 

   <e'\1 b\2 g\3 g\4 e\5 >4 <e'\1 b\2 g\3 g\4 e\5 >8 <\deadNote d\4 \deadNote a,\5 \deadNote e,\6 >16 <\deadNote d\4 \deadNote a,\5 \deadNote e,\6 >16 <c'\2 g\3 e\4 c\5 >4 <c'\2 g\3 e\4 c\5 >8 <\deadNote g\3 \deadNote d\4 \deadNote a,\5 >16 <\deadNote g\3 \deadNote d\4 \deadNote a,\5 >16 
   <g'\1 b\2 g\3 d\4 b,\5 g,\6 >8 <g'\1 b\2 g\3 d\4 b,\5 g,\6 >8 <g'\1 b\2 g\3 d\4 b,\5 g,\6 >8 <g'\1 b\2 g\3 d\4 b,\5 g,\6 >8 <g'\1 b\2 g\3 d\4 b,\5 g,\6 >8 <g'\1 b\2 g\3 d\4 b,\5 g,\6 >8 <g'\1 b\2 g\3 d\4 b,\5 g,\6 >8 <g'\1 b\2 g\3 d\4 b,\5 g,\6 >8 
   <g'\1 b\2 g\3 d\4 b,\5 g,\6 >8 <g'\1 b\2 g\3 d\4 b,\5 g,\6 >8 <g'\1 b\2 g\3 d\4 b,\5 g,\6 >8 <g'\1 b\2 g\3 d\4 b,\5 g,\6 >8 <g'\1 b\2 g\3 d\4 b,\5 g,\6 >8 <g'\1 b\2 g\3 d\4 b,\5 g,\6 >8 <g'\1 b\2 g\3 d\4 b,\5 g,\6 >8 <g'\1 b\2 g\3 d\4 b,\5 g,\6 >8 

   <e'\1 c'\2 g\3 e\4 c\5 >4 <e'\1 c'\2 g\3 e\4 c\5 >8 <\deadNote e'\1 \deadNote b\2 \deadNote g\3 \deadNote d\4 >16 <\deadNote e'\1 \deadNote b\2 \deadNote g\3 \deadNote d\4 >16 <e'\1 d'\2 g\3 fis\4 d\5 >4 <e'\1 d'\2 g\3 fis\4 d\5 >8 <\deadNote b\2 \deadNote g\3 \deadNote d\4 \deadNote a,\5 >16 <\deadNote b\2 \deadNote g\3 \deadNote d\4 \deadNote a,\5 >16 

   <e'\1 b\2 g\3 g\4 e\5 >4 <e'\1 b\2 g\3 g\4 e\5 >8 <\deadNote d\4 \deadNote a,\5 \deadNote e,\6 >16 <\deadNote d\4 \deadNote a,\5 \deadNote e,\6 >16 <c'\2 g\3 e\4 c\5 >4 <c'\2 g\3 e\4 c\5 >8 <\deadNote g\3 \deadNote d\4 \deadNote a,\5 >16 <\deadNote g\3 \deadNote d\4 \deadNote a,\5 >16 
   <g'\1 b\2 g\3 d\4 b,\5 g,\6 >8 <g'\1 b\2 g\3 d\4 b,\5 g,\6 >8 <g'\1 b\2 g\3 d\4 b,\5 g,\6 >8 <g'\1 b\2 g\3 d\4 b,\5 g,\6 >8 <g'\1 b\2 g\3 d\4 b,\5 g,\6 >8 <g'\1 b\2 g\3 d\4 b,\5 g,\6 >8 <g'\1 b\2 g\3 d\4 b,\5 g,\6 >8 <g'\1 b\2 g\3 d\4 b,\5 g,\6 >8 
   <g'\1 b\2 g\3 d\4 b,\5 g,\6 >8 <g'\1 b\2 g\3 d\4 b,\5 g,\6 >8 <g'\1 b\2 g\3 d\4 b,\5 g,\6 >8 <g'\1 b\2 g\3 d\4 b,\5 g,\6 >8 <g'\1 b\2 g\3 d\4 b,\5 g,\6 >8 <g'\1 b\2 g\3 d\4 b,\5 g,\6 >8 <g'\1 b\2 g\3 d\4 b,\5 g,\6 >8 <g'\1 b\2 g\3 d\4 b,\5 g,\6 >8 

   <e'\1 c'\2 g\3 e\4 c\5 >4 <e'\1 c'\2 g\3 e\4 c\5 >8 <\deadNote e'\1 \deadNote b\2 \deadNote g\3 \deadNote d\4 >16 <\deadNote e'\1 \deadNote b\2 \deadNote g\3 \deadNote d\4 >16 <e'\1 d'\2 g\3 fis\4 d\5 >4 <e'\1 d'\2 g\3 fis\4 d\5 >8 <\deadNote b\2 \deadNote g\3 \deadNote d\4 \deadNote a,\5 >16 <\deadNote b\2 \deadNote g\3 \deadNote d\4 \deadNote a,\5 >16 

   <e'\1 b\2 g\3 g\4 e\5 >4 <e'\1 b\2 g\3 g\4 e\5 >8 <\deadNote d\4 \deadNote a,\5 \deadNote e,\6 >16 <\deadNote d\4 \deadNote a,\5 \deadNote e,\6 >16 <c'\2 g\3 e\4 c\5 >4 <c'\2 g\3 e\4 c\5 >8 <\deadNote g\3 \deadNote d\4 \deadNote a,\5 >16 <\deadNote g\3 \deadNote d\4 \deadNote a,\5 >16 
   <g'\1 b\2 g\3 d\4 b,\5 g,\6 >8 <g'\1 b\2 g\3 d\4 b,\5 g,\6 >8 <g'\1 b\2 g\3 d\4 b,\5 g,\6 >8 <g'\1 b\2 g\3 d\4 b,\5 g,\6 >8 <g'\1 b\2 g\3 d\4 b,\5 g,\6 >8 <g'\1 b\2 g\3 d\4 b,\5 g,\6 >8 <g'\1 b\2 g\3 d\4 b,\5 g,\6 >8 <g'\1 b\2 g\3 d\4 b,\5 g,\6 >8 
   <e'\1 c'\2 g\3 e\4 c\5 >8 <e'\1 c'\2 g\3 e\4 c\5 >8 <e'\1 c'\2 g\3 e\4 c\5 >8 <e'\1 c'\2 g\3 e\4 c\5 >8 <e'\1 c'\2 g\3 e\4 c\5 >8 <e'\1 c'\2 g\3 e\4 c\5 >8 <e'\1 c'\2 g\3 e\4 c\5 >8 <e'\1 c'\2 g\3 e\4 c\5 >8 
   <e'\1 c'\2 g\3 e\4 c\5 >8 <e'\1 c'\2 g\3 e\4 c\5 >8 <e'\1 c'\2 g\3 e\4 c\5 >8 <e'\1 c'\2 g\3 e\4 c\5 >8 <e'\1 c'\2 g\3 e\4 c\5 >8 <e'\1 c'\2 g\3 e\4 c\5 >8 <e'\1 c'\2 g\3 e\4 c\5 >8 <e'\1 c'\2 g\3 e\4 c\5 >8 
   <e'\1 c'\2 g\3 e\4 c\5 >1 
   r1 
   <g'\1 b\2 g\3 d\4 b,\5 g,\6 >1 

   \bar "|."

   \pageBreak

#})

TrackAVoiceBMusic = #(define-music-function (parser location inTab) (boolean?)

#{

#})

TrackALyrics = \lyricmode {

   \set ignoreMelismata = ##t
   

   \unset ignoreMelismata

}

TrackAStaff = \new Staff <<

   \context Voice = "TrackAVoiceAMusic" {

      \TrackAVoiceAMusic ##f

   }

   \context Voice = "TrackAVoiceBMusic" {

      \TrackAVoiceBMusic ##f

   }
>>

TrackATabStaff = \new TabStaff \with { stringTunings = #`(,(ly:make-pitch 0 2 NATURAL) ,(ly:make-pitch -1 6 NATURAL) ,(ly:make-pitch -1 4 NATURAL) ,(ly:make-pitch -1 1 NATURAL) ,(ly:make-pitch -2 5 NATURAL) ,(ly:make-pitch -2 2 NATURAL) ) } <<

   \context TabVoice = "TrackAVoiceAMusic" {

      \removeWithTag #'chords

      \removeWithTag #'texts

      \TrackAVoiceAMusic ##t

   }

   \context TabVoice = "TrackAVoiceBMusic" {

      \removeWithTag #'chords

      \removeWithTag #'texts

      \TrackAVoiceBMusic ##t

   }
>>

TrackAStaffGroup = \new StaffGroup <<

   \set StaffGroup.instrumentName = #"Guitar"

   \TrackAStaff
>>

TrackBVoiceAMusic = #(define-music-function (parser location inTab) (boolean?)

#{

   \tempo 4=155

   \clef #(if $inTab "tab" "treble_8")

   \key g \major

   \time 4/4

   \oneVoice


   <b\2>2 <a\3>4. <g\3>8 

   <g~\3>2 <d\4>4 <b\2>4 
   <a\3>1 

   r2. r8 <g\3>8 

   <b\3>8 <g\3>4. <g\3>4 <c'\3>4 
   <c'\3>2 <b\3>2 

   <g\3>2. <c'\3>4 

   <c'\3>8 <c'\3>4. <b~\3>2 
   <b\3>2 <b\3>2 
   <d\4>1 
   r1 
   r1 
   r1 
   <b\3>4 <b\3>4 <a\3>4 <a\3>4 

   <g\3>2 <d\4>4 <b~\3>4 
   <b\3>1 

   r2. r8 <g\3>8 
   <b\3>4 <g\3>4 <g\3>4 <c'\3>4 
   <c'\3>2 <b\3>2 

   <g\3>2 r8 <\deadNote g\3>8 <c'\3>4 
   <c'\3>2 <b\3>2 

   <g\3>2 <e\4>4. <d\4>8 

   r8 <b,~\5>2 <b,\5>4. 
   r1 
   r1 

   r2. r8 <\deadNote a,\5>8 

   <d'\3>8 <d'\3>4. <d'~\3>4 <d'\3>8 <b\3>8 

   <c'\3>2 <d'~\3>4 <d'\3>8 <b~\3>8 

   <b\3>4 r2. 

   r2. r8 <\deadNote a,\5>8 

   <e'\3>8 <e'\3>4. <e'~\3>4 <e'\3>8 <d'\3>8 

   <d'\3>2 <g'\3>4 <g\3>8 <b~\3>8 

   <b\3>4 r2 r8 <\deadNote e,\6>8 

   <c'\3>8 <c'\3>4. <b\3>4 <b\3>4 
   <a\3>2 <g\3>4 <a\3>4 
   <b\3>2 <a\3>2 
   <e\4>1 

   r4 r8 <a\3>4. <g\3>4 

   <d\4>4 r2. 
   r1 
   r1 
   r1 
   r1 
   r1 
   r1 
   r1 
   <b\2>2 <a\3>4 <a\3>4 

   <g~\3>2 <d\4>4 <b\2>4 
   <a\3>1 

   r2. r8 <g\3>8 
   <b\3>4 <g\3>4 <g\3>4 <c'\3>4 
   <c'\3>2 <b\3>2 

   <g\3>2. r8 <d\4>8 

   <c'\3>4 <c'\3>8 <b~\3>4. <b\3>4 
   <g\3>2 <e\4>2 
   <d\4>1 
   r1 
   r1 
   r1 
   <b\2>2 <a\3>4 <a\3>4 

   <g~\3>2 <d\4>4 <b\2>4 
   <a\3>1 

   r2. r8 <g\3>8 
   <b\3>4 <g\3>4 <g\3>4 <c'\3>4 
   <c'\3>2 <b\3>2 

   <g\3>2. <c'\3>4 
   <c'\3>2 <b\3>2 

   <g\3>2 <e~\4>4 <e\4>8 <d~\4>8 
   <d\4>1 
   r1 
   r1 
   r1 

   <d'\3>8 <d'\3>4. <d'~\3>4 <d'\3>8 <b\3>8 

   <c'\3>2 <d'~\3>4 <d'\3>8 <b~\3>8 

   <b\3>4 r2. 

   r2. r8 <\deadNote a,\5>8 

   <e'\3>8 <e'\3>4. <e'~\3>4 <e'\3>8 <d'\3>8 

   <d'\3>2 <g'\3>4 <g\3>8 <b~\3>8 

   <b\3>4 r2 r8 <\deadNote e,\6>8 

   <c'\3>8 <c'\3>4. <b\3>4 <b\3>4 
   <a\3>2 <g\3>4 <a\3>4 
   <b\3>2 <a\3>2 
   <e\4>1 

   r4 r8 <a\3>4. <g\3>4 

   <d\4>4 r2. 
   r1 
   r1 
   r1 
   r1 
   r1 
   r1 
   r1 
   <e'\2>2 <d'\2>2 

   <g'\1>2 <c'~\2>4 <c'\2>8 <b~\2>8 
   <b\2>1 
   r1 
   <e'\2>2 <d'\2>2 

   <g'\1>2 <c'~\2>4 <c'\2>8 <b~\2>8 
   <b\2>1 
   r1 
   <e'\2>2 <d'\2>2 
   <g'\1>2 <c'\2>2 
   <b\2>1 

   <b\2>8 <c'~\2>8 <c'~\2>2. 
   <c'\2>1 

   r2 <b\2>8 <c'~\2>8 <c'\2>4 

   <b\2>16 <a\3>16 <g~\3>16 <g~\3>16 <g\3>4 r2 
   r1 

   \bar "|."

   \pageBreak

#})

TrackBVoiceBMusic = #(define-music-function (parser location inTab) (boolean?)

#{

#})

TrackBLyrics = \lyricmode {

   \set ignoreMelismata = ##t
   
       Cold is the wa- ter - - 
       It free- zes your al- ready cold mind
       Al- rea- dy cold, - cold mind
       Death is at your door- step - -
       And it will steal your in- no- cence
       But it will not steal your sub- stance -
       But you are not - a- lone in  - this - 
       And you are not - a- - lone in this - 
       As bro- thers we will stand and we'll hold your hand
       Hold your hand
       You are the mo- ther - -
       The mo- ther of your ba- by child
       The one to whom - you gave life
       You have your choi- ces - -
       And these are what - make man great
       His lad- der to the - stars - 
       You are not - a- lone in  - this - 
       And you are not - a- - lone in this - 
       As bro- thers we will stand and we'll hold your hand
       Hold your hand
       I will tell the - night -
       Whis- per, Lose your - sight -
       I can't move the moun- tains - - - for - - you - - - -

   \unset ignoreMelismata

}

TrackBStaff = \new Staff <<

   \context Voice = "TrackBVoiceAMusic" {

      \TrackBVoiceAMusic ##f

   }

   \context Voice = "TrackBVoiceBMusic" {

      \TrackBVoiceBMusic ##f

   }
      \new Lyrics \lyricsto "TrackBVoiceAMusic" {
     \TrackBLyrics
   }
>>

TrackBTabStaff = \new TabStaff \with { stringTunings = #`(,(ly:make-pitch 0 2 NATURAL) ,(ly:make-pitch -1 6 NATURAL) ,(ly:make-pitch -1 4 NATURAL) ,(ly:make-pitch -1 1 NATURAL) ,(ly:make-pitch -2 5 NATURAL) ,(ly:make-pitch -2 2 NATURAL) ) } <<

   \context TabVoice = "TrackBVoiceAMusic" {

      \removeWithTag #'chords

      \removeWithTag #'texts

      \TrackBVoiceAMusic ##t

   }

   \context TabVoice = "TrackBVoiceBMusic" {

      \removeWithTag #'chords

      \removeWithTag #'texts

      \TrackBVoiceBMusic ##t

   }
>>

TrackBStaffGroup = \new StaffGroup <<

   \set StaffGroup.instrumentName = #"Lead vocal"

   \TrackBStaff
>>

TrackCVoiceAMusic = #(define-music-function (parser location inTab) (boolean?)

#{

   \tempo 4=155

   \clef #(if $inTab "tab" "treble_8")

   \key g \major

   \time 4/4

   \oneVoice


   <d'\2>2 <c'\2>4. <c'\2>8 

   <b\2>2 <g\3>4 <d'~\2>4 
   <d'\2>1 

   r2. r8 <\deadNote e,\6>8 

   <d'\2>8 <c'\2>4. <b\2>4 <e'\2>4 
   <e'\2>2 <d'\2>2 

   <b\2>2. <e'\2>4 

   <e'\2>8 <e'\2>4. <d'~\2>2 
   <d'\2>2 <d'\2>2 
   <b\2>1 
   r1 
   r1 
   r1 
   <d'\2>4 <d'\2>4 <c'\2>4 <c'\2>4 

   <b\2>2 r4 <d'~\2>4 
   <d'\2>1 
   r1 
   <d'\2>4 <c'\2>4 <b\2>4 <e'\2>4 
   <e'\2>2 <d'\2>2 

   <b\2>2 r8 <\deadNote g\3>8 <e'\2>4 
   <e'\2>2 <d'\2>2 

   <c'\2>2 <b\2>4. <c'\2>8 

   r8 <g~\3>2 <g\3>4. 
   r1 
   r1 
   r1 

   <d'\2>8 <d'\2>4. <d'\2>4 r8 <b\2>8 

   <e'\2>2 <d'\2>4 r8 <d'~\2>8 

   <d'\2>4 r2. 
   r1 

   <c'\2>8 <c'\2>4. <c'\2>4 r8 <a\3>8 

   <b\2>2 <d'\2>4 r8 <d'~\2>8 

   <d'\2>4 r2 r8 <\deadNote e,\6>8 

   <d'\2>8 <d'\2>4. <d'\2>4 <d'\2>4 
   <d'\2>2 <d'\2>4 <d'\2>4 
   <d'\2>2 <c'\2>2 
   <b\2>1 
   r1 
   r1 
   r1 
   r1 
   r1 
   r1 
   r1 
   r1 
   r1 
   <d'\2>2 <c'\2>4 <c'\2>4 

   <b\2>2 <g\3>4 <d'~\2>4 
   <d'\2>1 

   r2. r8 <\deadNote e,\6>8 
   <d'\2>4 <c'\2>4 <b\2>4 <e'\2>4 
   <e'\2>2 <d'\2>2 

   <b\2>2. r8 <b\2>8 

   <e'\2>4 <e'\2>8 <d'~\2>4 <d'\2>4. 
   <c'\2>2 <d'\2>2 
   <b\2>1 
   r1 
   r1 
   r1 

   <d'~\2>4 <d'\2>4 <c'\2>4 <c'\2>4 

   <b\2>2 r4 <d'~\2>4 
   <d'\2>1 
   r1 
   <d'\2>4 <c'\2>4 <b\2>4 <e'\2>4 
   <e'\2>2 <d'\2>2 

   <b\2>2 r8 <\deadNote g\3>8 <e'\2>4 
   <e'\2>2 <d'\2>2 

   <c'\2>2 <b\2>4. <g~\3>8 
   <g\3>1 
   r1 
   r1 
   r1 

   <d'\2>8 <d'\2>4. <d'\2>4 r8 <b\2>8 

   <e'\2>2 <d'\2>4 r8 <d'~\2>8 

   <d'\2>4 r2. 
   r1 

   <c'\2>8 <c'\2>4. <c'\2>4 r8 <a\3>8 

   <b\2>2 <d'\2>4 r8 <d'~\2>8 

   <d'\2>4 r2 r8 <\deadNote e,\6>8 

   <d'\2>8 <d'\2>4. <d'\2>4 <d'\2>4 
   <d'\2>2 <d'\2>4 <d'\2>4 
   <d'\2>2 <c'\2>2 
   <b\2>1 

   r4 r8 <c'\2>4. <b\2>4 

   <b\2>4 r2. 
   r1 
   r1 
   r1 
   r1 
   r1 
   r1 
   r1 
   r1 
   r1 
   r1 
   r1 
   r1 
   r1 
   r1 
   r1 
   r1 
   r1 
   <d'\2>1 

   <d'\2>8 <e'~\2>8 <e'~\2>2. 
   <e'\2>1 
   r1 
   r1 
   r1 

   \bar "|."

   \pageBreak

#})

TrackCVoiceBMusic = #(define-music-function (parser location inTab) (boolean?)

#{

#})

TrackCLyrics = \lyricmode {

   \set ignoreMelismata = ##t
   

   \unset ignoreMelismata

}

TrackCStaff = \new Staff <<

   \context Voice = "TrackCVoiceAMusic" {

      \TrackCVoiceAMusic ##f

   }

   \context Voice = "TrackCVoiceBMusic" {

      \TrackCVoiceBMusic ##f

   }
>>

TrackCTabStaff = \new TabStaff \with { stringTunings = #`(,(ly:make-pitch 0 2 NATURAL) ,(ly:make-pitch -1 6 NATURAL) ,(ly:make-pitch -1 4 NATURAL) ,(ly:make-pitch -1 1 NATURAL) ,(ly:make-pitch -2 5 NATURAL) ,(ly:make-pitch -2 2 NATURAL) ) } <<

   \context TabVoice = "TrackCVoiceAMusic" {

      \removeWithTag #'chords

      \removeWithTag #'texts

      \TrackCVoiceAMusic ##t

   }

   \context TabVoice = "TrackCVoiceBMusic" {

      \removeWithTag #'chords

      \removeWithTag #'texts

      \TrackCVoiceBMusic ##t

   }
>>

TrackCStaffGroup = \new StaffGroup <<

   \set StaffGroup.instrumentName = #"High Harmony"

   \TrackCStaff
>>

TrackDVoiceAMusic = #(define-music-function (parser location inTab) (boolean?)

#{

   \tempo 4=155

   \clef #(if $inTab "tab" "treble_8")

   \key g \major

   \time 4/4

   \oneVoice


   <g\3>2 <g\3>4. <g\3>8 

   <g\3>2 <g~\3>2 
   <g\3>1 

   r2. r8 <g\3>8 

   <g\3>8 <g\3>4. <g\3>4 <g\3>4 
   <g\3>2 <g\3>2 

   <g\3>2. <g\3>4 

   <g\3>8 <g\3>4. <g~\3>2 
   <g\3>2 <a\3>2 
   <g\3>1 
   r1 
   r1 
   r1 
   <g\3>4 <g\3>4 <g\3>4 <g\3>4 

   <g\3>2 <g~\3>2 
   <g\3>1 

   r2. r8 <g\3>8 
   <g\3>4 <g\3>4 <g\3>4 <g\3>4 
   <g\3>2 <g\3>2 

   <g\3>2 r8 <\deadNote g\3>8 <g\3>4 
   <g\3>2 <g\3>2 

   <g\3>2 <g\3>4. <g\3>8 

   r8 <g~\3>2 <g\3>4. 
   r1 
   r1 
   r1 

   <fis\4>8 <fis\4>4. <fis~\4>4 <fis\4>8 <fis\4>8 

   <g\3>2 <g~\3>4 <g\3>8 <g~\3>8 

   <g\3>4 r2. 

   r2. r8 <\deadNote a,\5>8 

   <g\3>8 <g\3>4. <g~\3>4 <g\3>8 <g\3>8 

   <g\3>2 <g\3>4 <g\3>8 <g~\3>8 

   <g\3>4 r2. 

   <g\3>8 <g\3>4. <g\3>4 <g\3>4 
   <g\3>2 <g\3>4 <g\3>4 

   <g\3>2 <fis\4>2 
   <g\3>1 
   r1 
   r1 
   r1 
   r1 
   r1 
   r1 
   r1 
   r1 
   r1 
   <g\3>2 <g\3>4 <g\3>4 

   <g\3>2 <g\3>4 <g~\3>4 
   <g\3>1 

   r2. r8 <g\3>8 
   <g\3>4 <g\3>4 <g\3>4 <g\3>4 
   <g\3>2 <g\3>2 

   <g\3>2. r8 <g\3>8 

   <g\3>4 <g\3>8 <g~\3>4. <g\3>4 
   <g\3>2 <a\3>2 
   <g\3>1 
   r1 
   r1 
   r1 
   <g\3>2 <g\3>4 <g\3>4 

   <g\3>2 <g\3>4 <g~\3>4 
   <g\3>1 

   r2. r8 <g\3>8 
   <g\3>4 <g\3>4 <g\3>4 <g\3>4 
   <g\3>2 <g\3>2 

   <g\3>2. <g\3>4 
   <g\3>2 <g\3>2 

   <g\3>2 <g~\3>4 <g\3>8 <g~\3>8 
   <g\3>1 
   r1 
   r1 
   r1 

   <fis\4>8 <fis\4>4. <fis~\4>4 <fis\4>8 <fis\4>8 

   <g\3>2 <g~\3>4 <g\3>8 <g~\3>8 

   <g\3>4 r2. 

   r2. r8 <\deadNote a,\5>8 

   <g\3>8 <g\3>4. <g~\3>4 <g\3>8 <g\3>8 

   <g\3>2 <g\3>4 <g\3>8 <g~\3>8 

   <g\3>4 r2. 

   <g\3>8 <g\3>4. <g\3>4 <g\3>4 
   <g\3>2 <g\3>4 <g\3>4 

   <g\3>2 <fis\4>2 
   <g\3>1 
   r1 
   r1 
   r1 
   r1 
   r1 
   r1 
   r1 
   r1 
   r1 
   <g\3>2 <g\3>2 
   <g\3>2 <g\3>2 

   <g\3>4 r2. 
   r1 
   <g\3>2 <g\3>2 
   <g\3>2 <g\3>2 

   <g\3>4 r2. 
   r1 
   <g\3>2 <g\3>2 
   <g\3>2 <g\3>2 
   <g\3>1 

   <g~\3>1 
   <g\3>1 
   r1 
   r1 
   r1 

   \bar "|."

   \pageBreak

#})

TrackDVoiceBMusic = #(define-music-function (parser location inTab) (boolean?)

#{

#})

TrackDLyrics = \lyricmode {

   \set ignoreMelismata = ##t
   

   \unset ignoreMelismata

}

TrackDStaff = \new Staff <<

   \context Voice = "TrackDVoiceAMusic" {

      \TrackDVoiceAMusic ##f

   }

   \context Voice = "TrackDVoiceBMusic" {

      \TrackDVoiceBMusic ##f

   }
>>

TrackDTabStaff = \new TabStaff \with { stringTunings = #`(,(ly:make-pitch 0 2 NATURAL) ,(ly:make-pitch -1 6 NATURAL) ,(ly:make-pitch -1 4 NATURAL) ,(ly:make-pitch -1 1 NATURAL) ,(ly:make-pitch -2 5 NATURAL) ,(ly:make-pitch -2 2 NATURAL) ) } <<

   \context TabVoice = "TrackDVoiceAMusic" {

      \removeWithTag #'chords

      \removeWithTag #'texts

      \TrackDVoiceAMusic ##t

   }

   \context TabVoice = "TrackDVoiceBMusic" {

      \removeWithTag #'chords

      \removeWithTag #'texts

      \TrackDVoiceBMusic ##t

   }
>>

TrackDStaffGroup = \new StaffGroup <<

   \set StaffGroup.instrumentName = #"Mid Harmony"

   \TrackDStaff
>>

TrackEVoiceAMusic = #(define-music-function (parser location inTab) (boolean?)

#{

   \tempo 4=155

   \clef #(if $inTab "tab" "treble_8")

   \key g \major

   \time 4/4

   \oneVoice


   <d\4>2 <c\5>4. <b,\5>8 

   <b,\5>2 <d~\4>2 
   <d\4>1 
   r1 

   <d\4>8 <c\5>4. <b,\5>4 <e\4>4 
   <e\4>2 <d\4>2 

   <b,\5>2. <e\4>4 

   <e\4>8 <e\4>4. <d~\4>2 
   <d\4>2 <d\4>2 
   <g,\6>1 
   r1 
   r1 
   r1 
   <d\4>4 <d\4>4 <c\5>4 <c\5>4 

   <b,\5>2 <d~\4>2 
   <d\4>1 
   r1 
   <d\4>4 <c\5>4 <b,\5>4 <e\4>4 
   <e\4>2 <d\4>2 
   <b,\5>2 r4 <e\4>4 
   <e\4>2 <d\4>2 

   <c\5>2 <b,\5>4. <c\5>8 

   r8 <g,~\6>2 <g,\6>4. 
   r1 
   r1 
   r1 

   <d\4>8 <d\4>4. <d~\4>4 <d\4>8 <b,\5>8 

   <c\5>2 <d~\4>4 <d\4>8 <b,~\5>8 

   <b,\5>4 r2. 
   r1 

   <e\4>8 <e\4>4. <e~\4>4 <e\4>8 <d\4>8 
   <d\4>2 <g\4>4 <g,\6>8 <b,\5>8 
   r1 

   <c\5>8 <c\5>4. <c\5>4 <c\5>4 
   <d\5>2 <d\5>4 <d\5>4 

   <g,\6>2 <fis,\6>2 
   <e,\6>1 
   r1 
   r1 
   r1 
   r1 
   r1 
   r1 
   r1 
   r1 
   r1 
   <d\4>2 <c\5>4 <c\5>4 

   <b,\5>2 <d~\4>2 
   <d\4>1 
   r1 
   <d\4>4 <c\5>4 <b,\5>4 <e\4>4 
   <e\4>2 <d\4>2 

   <b,\5>2. r4 

   <e\4>4 <e\4>8 <d~\4>4. <d\4>4 
   <b,\5>2 <c\5>2 
   <g,\6>1 
   r1 
   r1 
   r1 
   <d\4>2 <c\5>4 <c\5>4 

   <b,\5>2 <d~\4>2 
   <d\4>1 
   r1 
   <d\4>4 <c\5>4 <b,\5>4 <e\4>4 
   <e\4>2 <d\4>2 

   <b,\5>2. <e\4>4 
   <e\4>2 <d\4>2 

   <c\5>2 <b,~\5>4 <b,\5>8 <c\5>8 
   <g,\6>1 
   r1 
   r1 
   r1 

   <d\4>8 <d\4>4. <d~\4>4 <d\4>8 <b,\5>8 

   <c\5>2 <d~\4>4 <d\4>8 <b,~\5>8 

   <b,\5>4 r2. 
   r1 

   <e\4>8 <e\4>4. <e~\4>4 <e\4>8 <d\4>8 
   <d\4>2 <g\4>4 <g,\6>8 <b,\5>8 
   r1 

   <c\5>8 <c\5>4. <c\5>4 <c\5>4 
   <d\5>2 <d\5>4 <d\5>4 

   <g,\6>2 <fis,\6>2 
   <e,\6>1 
   r1 
   r1 
   r1 
   r1 
   r1 
   r1 
   r1 
   r1 
   r1 
   r1 
   r1 
   r1 
   r1 
   r1 
   r1 
   r1 
   r1 
   r1 
   r1 
   <b,\5>1 
   <c\5>1 
   <c\5>1 
   r1 
   r1 
   r1 

   \bar "|."

   \pageBreak

#})

TrackEVoiceBMusic = #(define-music-function (parser location inTab) (boolean?)

#{

#})

TrackELyrics = \lyricmode {

   \set ignoreMelismata = ##t
   

   \unset ignoreMelismata

}

TrackEStaff = \new Staff <<

   \context Voice = "TrackEVoiceAMusic" {

      \TrackEVoiceAMusic ##f

   }

   \context Voice = "TrackEVoiceBMusic" {

      \TrackEVoiceBMusic ##f

   }
>>

TrackETabStaff = \new TabStaff \with { stringTunings = #`(,(ly:make-pitch 0 2 NATURAL) ,(ly:make-pitch -1 6 NATURAL) ,(ly:make-pitch -1 4 NATURAL) ,(ly:make-pitch -1 1 NATURAL) ,(ly:make-pitch -2 5 NATURAL) ,(ly:make-pitch -2 2 NATURAL) ) } <<

   \context TabVoice = "TrackEVoiceAMusic" {

      \removeWithTag #'chords

      \removeWithTag #'texts

      \TrackEVoiceAMusic ##t

   }

   \context TabVoice = "TrackEVoiceBMusic" {

      \removeWithTag #'chords

      \removeWithTag #'texts

      \TrackEVoiceBMusic ##t

   }
>>

TrackEStaffGroup = \new StaffGroup <<

   \set StaffGroup.instrumentName = #"Bass Harmony"

   \TrackEStaff
>>

\score {
   <<

   \TrackAStaffGroup

   \TrackBStaffGroup

   \TrackCStaffGroup

   \TrackDStaffGroup

   \TrackEStaffGroup
   >>

   \header {

      title = "Timshel" 

      composer = "Mumford & Sons" 

   }

}


%{
convert-ly.py (GNU LilyPond) 2.14.2 Processing `'...  Applying
conversion: 2.11.2, 2.11.3, 2.11.5, 2.11.6, 2.11.10, 2.11.11, 2.11.13,
2.11.15, 2.11.23, 2.11.35, 2.11.38, 2.11.46, 2.11.48, 2.11.50,
2.11.51, 2.11.52, 2.11.53, 2.11.55, 2.11.57, 2.11.60, 2.11.61,
2.11.62, 2.11.64, 2.12.0, 2.12.3, 2.13.0, 2.13.1, 2.13.4, 2.13.10,
2.13.16, 2.13.18, 2.13.20, 2.13.29, 2.13.31, 2.13.36, 2.13.39,
2.13.40, 2.13.42, 2.13.44, 2.13.46, 2.13.48, 2.13.51, 2.14.0
%}
