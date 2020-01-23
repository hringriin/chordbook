FILENAME=Chordbook
FILENAMEPATH=../TeX/Chordbook
FILENAMEEXTENDED=Chordbook_Extended
FILENAMEPATHEXTENDED=../TeX/Chordbook_Extended
PDF=$(FILENAME).pdf
LATEXSRC=../src/*/LaTeX/*.tex
PDFSRC=../src/*/lilypond/PDF/*.pdf

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

Music: lilypond $(FILENAMEEXTENDED).pdf clean
	@printf "\n*** \033[0;32mCompiling \033[0;33mDetailed-$(FILENAME) \033[0;32mdone!\033[0m\n\n"

$(FILENAMEEXTENDED).pdf: $(FILENAMEPATHEXTENDED)/$(FILENAMEEXTENDED).tex $(PDFSRC)
	@printf "\n*** \033[0;32mCompiling \033[0;33m$(FILENAMEEXTENDED) \033[0;32m...\033[0m\n\n"
	@sleep 2
	pdflatex -synctex=1 $(FILENAMEPATHEXTENDED)/$(FILENAMEEXTENDED).tex;
	@if(grep "citation" $(FILENAMEPATHEXTENDED)/$(FILENAMEEXTENDED).aux > /dev/null); \
		then \
			bibtex $(FILENAMEPATHEXTENDED)/$(FILENAMEEXTENDED); \
			pdflatex -synctex=1 $(FILENAMEPATHEXTENDED)/$(FILENAMEEXTENDED).tex; \
	fi;
	
	@if(grep "istfilename" $(FILENAMEPATHEXTENDED)/$(FILENAMEEXTENDED).aux > /dev/null); \
		then \
			makeglossaries $(FILENAMEPATHEXTENDED)/$(FILENAMEEXTENDED); \
			pdflatex -synctex=1 $(FILENAMEPATHEXTENDED)/$(FILENAMEEXTENDED).tex; \
			makeglossaries $(FILENAMEPATHEXTENDED)/$(FILENAMEEXTENDED); \
	fi;
	
	@if(grep "citation" $(FILENAMEPATHEXTENDED)/$(FILENAMEEXTENDED).aux > /dev/null); \
		then \
			bibtex $(FILENAMEPATHEXTENDED)/$(FILENAMEEXTENDED); \
			pdflatex -synctex=1 $(FILENAMEPATHEXTENDED)/$(FILENAMEEXTENDED).tex; \
	fi;
	pdflatex -synctex=1 $(FILENAMEPATHEXTENDED)/$(FILENAMEEXTENDED).tex;
	pdflatex -synctex=1 $(FILENAMEPATHEXTENDED)/$(FILENAMEEXTENDED).tex;

lilypond:
	@../bin/compileLily.bash

clean:
	@printf "\n*** \033[0;32mCleaning up \033[0;33m$(FILENAME) \033[0;32m...\033[0m\n\n"
	@-rm -v *.aux;
	@-rm -v *.log;
	@-rm -v *.toc;
	@-rm -v *.out;
	@printf "\n*** \033[0;32mCleaning up \033[0;33m$(FILENAME) \033[0;32mdone!\033[0m\n\n"

cleanAll: clean
	@-rm -v $(FILENAME).pdf
	@-rm -v $(FILENAMEEXTENDED).pdf
	@-rm -v $(FILENAME).synctex.gz
	@-rm -v $(FILENAMEEXTENDED).synctex.gz
	@-rm -vr ../PUBLISH
	@../bin/cleanLily.bash