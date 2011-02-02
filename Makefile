# makefile for pdflatex
#
MAKEFLAGS += -j4
SOURCES=$(wildcard fig/*.svg)
OBJECTS=$(SOURCES:.svg=.pdf)

%.pdf: %.svg
	inkscape --export-latex --export-area-drawing --export-pdf $@ $<

notes.pdf: notes.tex preliminaries.tex $(OBJECTS)
	pdflatex -file-line-error notes

clean:
	rm -f fig/*.pdf fig/*.pdf_tex notes.aux notes.bbl notes.blg notes.lof notes.log notes.lot notes.out notes.toc notes.pdf

