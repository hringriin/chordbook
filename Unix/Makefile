movepdf = yes

FILENAME=../TeX/Chordbook/Chordbook
FILENAME_EXTENDED=../TeX/Chordbook_Extended/Chordbook_Extended
PDF=Chordbook.pdf

all: document clean

extended: document lilypond document_extended clean

clean:
	@echo "+-------------------------------------------+";
	@echo "|  Deleting temporary files - cleaning up!  |";
	@echo "+-------------------------------------------+";
	@sleep 2
	rm -f *.aux;
	rm -f *.bbl;
	rm -f *.blg;
	rm -f *.glg;
	rm -f *.glo;
	rm -f *.gls;
	rm -f *.ist;
	rm -f *.log;
	rm -f *.mx1;
	rm -f *.tdo;
	rm -f *.toc;
	rm -f *.out;

rmpdf:
	@echo "+----------------+";
	@echo "|  Deleting PDF  |";
	@echo "+----------------+";
	@sleep 2
	rm -f $(PDF);

lilypond:
	@echo "+-----------------------------------------------------+";
	@echo "|  Compiling 'Lilypond' - This may take a long time!  |";
	@echo "+-----------------------------------------------------+";
	@sleep 2
	$(MAKE) -C ../Templates/

# for server deploy
server: document clean
	cp -rf $(PDF) /var/www/archive.chordbook/LATEST_$(PDF)
	cp -rf $(PDF) /var/www/archive.chordbook/`date "+%Y-%m-%d_%H:%M:%S"`_$(PDF)

document_extended:
	@echo "+----------------------------------+";
	@echo "|  Compiling 'EXTENDED Chordbook'  |";
	@echo "+----------------------------------+";
	@sleep 2
	pdflatex -synctex=1 $(FILENAME_EXTENDED).tex;
	@if(grep "citation" $(FILENAME_EXTENDED).aux > /dev/null); \
		then \
			bibtex $(FILENAME_EXTENDED); \
			pdflatex -synctex=1 $(FILENAME_EXTENDED).tex; \
	fi;
	
	@if(grep "istfilename" $(FILENAME_EXTENDED).aux > /dev/null); \
		then \
			makeglossaries $(FILENAME_EXTENDED); \
			pdflatex -synctex=1 $(FILENAME_EXTENDED).tex; \
			makeglossaries $(FILENAME_EXTENDED); \
	fi;
	
	@if(grep "citation" $(FILENAME_EXTENDED).aux > /dev/null); \
		then \
			bibtex $(FILENAME_EXTENDED); \
			pdflatex -synctex=1 $(FILENAME_EXTENDED).tex; \
	fi;
	pdflatex -synctex=1 $(FILENAME_EXTENDED).tex;
	pdflatex -synctex=1 $(FILENAME_EXTENDED).tex;

document:
	@clear
	@echo "+-------------------------+";
	@echo "|  Compiling 'Chordbook'  |";
	@echo "+-------------------------+";
	@sleep 2
	pdflatex -synctex=1 $(FILENAME).tex;
	@if(grep "citation" $(FILENAME).aux > /dev/null); \
		then \
			bibtex $(FILENAME); \
			pdflatex -synctex=1 $(FILENAME).tex; \
	fi;
	
	@if(grep "istfilename" $(FILENAME).aux > /dev/null); \
		then \
			makeglossaries $(FILENAME); \
			pdflatex -synctex=1 $(FILENAME).tex; \
			makeglossaries $(FILENAME); \
	fi;
	
	@if(grep "citation" $(FILENAME).aux > /dev/null); \
		then \
			bibtex $(FILENAME); \
			pdflatex -synctex=1 $(FILENAME).tex; \
	fi;
	pdflatex -synctex=1 $(FILENAME).tex;
	pdflatex -synctex=1 $(FILENAME).tex;

copyPDF:
	@echo "+--------------------------------------+";
	@echo "|  Copying PDF and renaming properly!  |";
	@echo "+--------------------------------------+";
	@sleep 2
	cp -iv $(PDF) ../Chordbook/`date "+%Y-%m-%d_%H:%M:%S"`_$(PDF)

publish:
	@rm -rf ../PUBLISH
	@echo "press any key to continue"
	@read -e
	@mkdir -p ../PUBLISH/rehearsal_MIDI
	@cp -r ../rehearsal_MIDI/ ../PUBLISH/rehearsal_MIDI
	@cp Chordbook.pdf Chordbook_Extended.pdf ../PUBLISH
	@tar -zcvf Chordbook_EXTENDED.tar.gz ../PUBLISH/
	@zip -r Chordbook_EXTENDED.zip ../PUBLISH
	@mv Chordbook_EXTENDED.tar.gz Chordbook_EXTENDED.zip ..
