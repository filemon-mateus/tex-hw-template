HW := hw1.pdf hw2.pdf hw3.pdf hw4.pdf hw5.pdf hw6.pdf hw7.pdf

CUPDATE ?= 0
LATEXMK := latexmk
OPTIONS := -pdf -outdir=pdf-files -auxdir=aux-files

ifeq ($(CUPDATE), 1)
	OPTIONS += -pvc
else
	OPTIONS += -pv
endif

all: $(HW)

%.pdf: tex-files/%.tex
	$(LATEXMK) $(OPTIONS) $<

clean:
	$(LATEXMK) $(OPTIONS) -c aux-files/*.aux

distclean:
	$(LATEXMK) $(OPTIONS) -C pdf-files/*.pdf

.PRECIOUS: pdf-files/%.pdf

.PHONY: all clean distclean
