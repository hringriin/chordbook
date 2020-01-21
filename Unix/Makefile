FILENAME=Chordbook
FILENAMEPATH=../TeX/Chordbook
PDF=$(FILENAME).pdf
LATEXSRC=../src/*/LaTeX/*.tex
LILYPONDSRC=../src/*/lilypond/Makefile

.PHONY: clean

LaTeX: $(FILENAME).pdf clean
	@printf "\n*** \033[0;32mCompiling \033[0;33m$(FILENAME) \033[0;32mdone!\033[0m\n\n"

$(FILENAME).pdf: $(FILENAMEPATH)/$(FILENAME).tex $(LATEXSRC)
	@printf "\n*** \033[0;32mCompiling \033[0;33m$(FILENAME) \033[0;32m...\033[0m\n\n"
	@sleep 2
	pdflatex -synctex=1 $(FILENAMEPATH)/$(FILENAME).tex;
	@if(grep "citation" $(FILENAMEPATH)/$(FILENAME).aux > /dev/null); \
		then \
			bibtex $(FILENAMEPATH)/$(FILENAME); \
			pdflatex -synctex=1 $(FILENAMEPATH)/$(FILENAME).tex; \
	fi;
	
	@if(grep "istfilename" $(FILENAMEPATH)/$(FILENAME).aux > /dev/null); \
		then \
			makeglossaries $(FILENAMEPATH)/$(FILENAME); \
			pdflatex -synctex=1 $(FILENAMEPATH)/$(FILENAME).tex; \
			makeglossaries $(FILENAMEPATH)/$(FILENAME); \
	fi;
	
	@if(grep "citation" $(FILENAMEPATH)/$(FILENAME).aux > /dev/null); \
		then \
			bibtex $(FILENAMEPATH)/$(FILENAME); \
			pdflatex -synctex=1 $(FILENAMEPATH)/$(FILENAME).tex; \
	fi;
	pdflatex -synctex=1 $(FILENAMEPATH)/$(FILENAME).tex;
	pdflatex -synctex=1 $(FILENAMEPATH)/$(FILENAME).tex;

Detailed: lilypond
	@printf "\n*** \033[0;32mCompiling \033[0;33mDetailed-$(FILENAME) \033[0;32mdone!\033[0m\n\n"

lilypond:
	@../bin/compileLily.bash

clean:
	@-rm -v *.aux;
	@-rm -v *.log;
	@-rm -v *.toc;
	@-rm -v *.out;

cleanAll: clean
	@-rm -v Chordbook.pdf
	@-rm -v Chordbook.synctex.gz
	@-rm -vr REHEARSAL/
	@../bin/cleanLily.bash
