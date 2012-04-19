
.PHONY: all
all: resume.pdf

%.pdf: %.tex
	pdftex $<

.PHONY: clean
clean:
	rm -f *.log
	rm -f *.pdf

