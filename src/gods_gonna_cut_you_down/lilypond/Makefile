# the dir where the lilypond files are located
FILES=./*
CPU_CORES=`cat /proc/cpuinfo | grep -m1 "cpu cores" | sed s/".*: "//`
LILYPARAM := -ddelete-intermediate-files -dno-point-and-click -djob-count=$(CPU_CORES)

all: compile movePDF moveMIDI

compile:
	lilypond $(LILYPARAM) $(FILES).ly

movePDF:
	@if [ -e *.pdf ] ; then if [ ! -d PDF ] ; then mkdir PDF ; fi ; mv *.pdf PDF/ ; fi

moveMIDI:
	@if [ -e *.midi ] ; then if [ ! -d MIDI ] ; then mkdir MIDI ; fi ; mv *.midi MIDI/ ; fi

purgeALL: purgePDF purgeMIDI

purgePDF:
	rm -rf PDF

purgeMIDI:
	rm -rf MIDI
