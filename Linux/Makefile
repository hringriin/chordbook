FILENAME=Chordbook
FILENAMEPATH=../TeX/Chordbook
FILENAMEEXTENDED=Chordbook_Extended
FILENAMEPATHEXTENDED=../TeX/Chordbook_Extended
PDF=$(FILENAME).pdf
LATEXSRC=../src/*/LaTeX/*.tex
PDFSRC= ../PUBLISH/REHEARSAL/*/*.pdf

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

music: $(FILENAMEEXTENDED).pdf clean
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

makefiles:
	@../bin/makefiles.bash

help:
	@printf "\nHow to compiles this document:\n"
	@printf "==============================\n\n"
	@printf "Run    'make'              to compile chordbook.\n"
	@printf "Run    'make lilypond'     to compile all the lilypond files (needed for the Extended Chordbook).\n"
	@printf "Run    'make music'        to compile the Extended Chordbook.\n"
	@printf "Run    'make clean'        to clean up unnecessary files.\n"
	@printf "Run    'make cleanAll'     to start over new.\n\n\n"
	@printf "'make lilypond' will create a folder called 'PUBLISH' in the root directory of this repository and within this folder a folder called 'REHEARSAL'. All the PDFs and MIDI files of each song are stored in this folder.\n"
	@printf "'make music' will need and use these documents to create the Extended Chordbook.\n"

publish: ../PUBLISH/Chordbook.tar.gz ../PUBLISH/Chordbook.zip

../PUBLISH/Chordbook.tar.gz: ../PUBLISH/REHEARSAL/*/*.midi
	@cp $(FILENAME).pdf $(FILENAMEEXTENDED).pdf ../PUBLISH/
	@cd ../PUBLISH && tar -zcvf Chordbook.tar.gz $(FILENAME).pdf $(FILENAMEEXTENDED).pdf REHEARSAL
	@cd ../PUBLISH && zip -r Chordbook.zip $(FILENAME).pdf $(FILENAMEEXTENDED).pdf REHEARSAL

../PUBLISH/Chordbook.zip: ../PUBLISH/REHEARSAL/*/*.midi
	@cd ../PUBLISH && zip -r Chordbook.zip $(FILENAME).pdf $(FILENAMEEXTENDED).pdf REHEARSAL


clean:
	@printf "\n*** \033[0;32mCleaning up ...\033[0m\n\n"
	@-rm -v *.aux;
	@-rm -v *.log;
	@-rm -v *.toc;
	@-rm -v *.out;
	@printf "\n*** \033[0;32mCleaning up done!\033[0m\n\n"

cleanAll: clean
	@-rm -v $(FILENAME).pdf
	@-rm -v $(FILENAMEEXTENDED).pdf
	@-rm -v $(FILENAME).synctex.gz
	@-rm -v $(FILENAMEEXTENDED).synctex.gz
	@-rm -vr ../PUBLISH
	@../bin/cleanLily.bash
