# Hier den Namen der Tex Datei eintragen,
# aber OHNE DIE ENDUNG .tex !!!!

movepdf = yes

FILENAME=Chordbook

all: document clean

clean:
	@echo "+--------------------------------------+";
	@echo "|  Loesche ueberfluessige Dateien ...  |";
	@echo "+--------------------------------------+";
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
	@echo "+-------------------+";
	@echo "|  Loesche die PDF  |";
	@echo "+-------------------+";
	rm -f $(FILENAME).pdf;

document:
	@echo "+------------------------------------------------------+";
	@echo "|  Kompiliere das Dokument. Das kann jetzt dauern ...  |";
	@echo "+------------------------------------------------------+";
	pdflatex $(FILENAME).tex;
	@if(grep "citation" $(FILENAME).aux > /dev/null); \
		then \
			bibtex $(FILENAME); \
			pdflatex $(FILENAME).tex; \
	fi;
	
	@if(grep "istfilename" $(FILENAME).aux > /dev/null); \
		then \
			makeglossaries $(FILENAME); \
			pdflatex $(FILENAME).tex; \
			makeglossaries $(FILENAME); \
	fi;
	
	@if(grep "citation" $(FILENAME).aux > /dev/null); \
		then \
			bibtex $(FILENAME); \
			pdflatex $(FILENAME).tex; \
	fi;
	pdflatex $(FILENAME).tex;
	pdflatex $(FILENAME).tex;

#cppdf:
#	@echo "\n\n\n\n+------------------------------------------------+";
#	@echo "|  Nur, wenn Du die PDF auch committen willst!;  |";
#	@echo "|  Antworte mit [y]es oder [n]o!                 |";
#	@echo "+------------------------------------------------+\n\n";
#	@if !(test -d ./build); \
#		then mkdir ./build \
#		&& echo "\nBuild directory created."; \
#		else echo "\nBuild directory exists. Nothing changed."; \
#	fi;
#	@cp -vi $(FILENAME).pdf ./build/
