PROJECT=Informe1
TEX=pdflatex
BIBTEX=bibtex
BUILDTEX=$(TEX) $(PROJECT).tex

all: clean
	$(BUILDTEX)
	$(BIBTEX) $(PROJECT)
	$(BUILDTEX)
	$(BUILDTEX)
	open $(PROJECT).pdf
	


#compile: %.tex Makefile
#	pdflatex --enable-write18 $< && bibtex Taxonomia.aux && pdflatex $< && pdflatex $< && open Taxonomia.pdf

#%.pdf: %.tex Makefile
#	pdflatex --enable-write18 $< && bibtex $<	.aux && pdflatex $< && pdflatex $< && open $< pdf

clean:
	rm -f *.dvi *.log *.bak *.aux *.bbl *.blg *.idx *.ps *.eps *.pdf *.toc *.out *~

open: clean
	open $(PROJECT).pdf
