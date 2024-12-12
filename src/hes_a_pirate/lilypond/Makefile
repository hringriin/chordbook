# the dir where the lilypond files are located
FILENAME=hes_a_pirate
REHEARSAL=../../../PUBLISH/REHEARSAL
ccred=$(echo -e "\033[0;31m")
ccyellow=$(echo -e "\033[0;33m")
ccgreen=$(echo -e "\033[0;32m")
ccend=$(echo -e "\033[0m")


LILYPARAM := -ddelete-intermediate-files -dno-point-and-click -o $(FILENAME)_ly

.PHONY: clean

all: $(FILENAME)_ly.pdf $(REHEARSAL)/$(FILENAME)/$(FILENAME)_ly.pdf $(REHEARSAL)/$(FILENAME)/$(FILENAME)_ly.midi
	@printf "\n>>> \033[0;32mCompiling: \033[0;33m$(FILENAME) \033[0;32mdone!\033[0m\n\n"

$(FILENAME)_ly.pdf: $(FILENAME).ly
	@printf "\n>>> \033[0;32mCompiling: \033[0;33m$(FILENAME) \033[0;32m...\033[0m\n\n"
	lilypond $(LILYPARAM) $(FILENAME).ly

$(REHEARSAL)/$(FILENAME)/$(FILENAME)_ly.pdf: $(FILENAME)_ly.pdf
	@if [ ! -d $(REHEARSAL)/$(FILENAME) ] ; then mkdir -p $(REHEARSAL)/$(FILENAME) ; fi
	@cp -rv *.pdf $(REHEARSAL)/$(FILENAME)/

$(REHEARSAL)/$(FILENAME)/$(FILENAME)_ly.midi: $(FILENAME)_ly.midi
	@if [ ! -d $(REHEARSAL)/$(FILENAME) ] ; then mkdir -p $(REHEARSAL)/$(FILENAME) ; fi
	@cp -rv *.midi $(REHEARSAL)/$(FILENAME)/

clean:
	@printf "\n>>> \033[0;32mCleaning up: \033[0;33m$(FILENAME) \033[0;32m...\033[0m\n\n"
	@-rm -v *.pdf
	@-rm -v *.midi
	@-rm -vr MIDI/
	@-rm -vr PDF/
	@printf "\n>>> \033[0;32mCleaning up: \033[0;33m$(FILENAME) \033[0;32mdone!\033[0m\n\n"
