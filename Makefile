# makefile for pdflatex
#
MAKEFLAGS += -j4
SOURCES=$(wildcard fig/*.svg)
OBJECTS=$(SOURCES:.svg=.pdf)

%.pdf: %.svg
	inkscape --export-latex --export-area-drawing --export-pdf $@ $<

notes.pdf: notes.tex preliminaries.tex fieldtheory.tex grouptheory.tex $(OBJECTS)
	pdflatex -synctex=1 -file-line-error notes && makeindex notes && pdflatex -synctex=1 -file-line-error notes && pdflatex -synctex=1 -file-line-error notes

clean:
	rm -f fig/*.pdf fig/*.pdf_tex notes.aux notes.bbl notes.blg notes.idx notes.ilg notes.ind notes.lof notes.log notes.lot notes.out notes.synctex.gz notes.toc notes.pdf

