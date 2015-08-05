movepdf = yes

FILENAME=../TeX/Chordbook/Chordbook

all: document clean

clean:
	@echo "+-------------------------------------------+";
	@echo "|  Deleting temporary files - cleaning up!  |";
	@echo "+-------------------------------------------+";
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
	rm -f $(FILENAME).pdf;

document:
	@clear
	@echo "+-----------------------------------------------------+";
	@echo "|  Compiling 'Chordbook' .. This may take a while ..  |";
	@echo "+-----------------------------------------------------+";
	@sleep 1
	@echo " ... 3"
	@sleep 1
	@clear
	@echo "+-----------------------------------------------------+";
	@echo "|  Compiling 'Chordbook' .. This may take a while ..  |";
	@echo "+-----------------------------------------------------+";
	@echo " ... 2"
	@sleep 1
	@clear
	@echo "+-----------------------------------------------------+";
	@echo "|  Compiling 'Chordbook' .. This may take a while ..  |";
	@echo "+-----------------------------------------------------+";
	@echo " ... 1"
	@sleep 1
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
