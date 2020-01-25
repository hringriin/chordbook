FILENAME=mybook
# Hier den Namen der Tex Datei eintragen,
# aber OHNE DIE ENDUNG .tex !!!!


.PHONY: clean

all: $(FILENAME).pdf

out/$(FILENAME).tex: $(FILENAME).lytex
	@lilypond-book --output=out --pdf $(FILENAME).lytex
	@lilypond-book --output=out --pdf $(FILENAME).lytex
	@lilypond-book --output=out --pdf $(FILENAME).lytex

out/$(FILENAME).pdf: out/$(FILENAME).tex $(FILENAME).lytex
	@cd out && pdflatex $(FILENAME).tex
	@cd out && pdflatex $(FILENAME).tex
	@cd out && pdflatex $(FILENAME).tex

$(FILENAME).pdf: out/$(FILENAME).pdf
	@cp -v out/$(FILENAME).pdf .

clean:
	@-rm -r out
