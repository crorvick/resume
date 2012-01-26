
fonts = 

.PHONY: all
all: resume.pdf

%.afm: %.ttf
	ttf2afm -e 8r.enc -o $@ $<

%.tfm: %.afm
	afm2tfm $< -T 8r.enc

%.pdf: %.tex pdftex.map
	pdftex $<

pdftex.map: $(foreach font, $(fonts), $(font).tfm)
	for f in $(fonts); do \
		echo `afm2tfm $$f.afm -T 8r.enc $$f.tfm` \<$$f.ttf ; \
	done >$@

.PHONY: clean
clean:
	rm -f *.log
	rm -f *.pdf
	rm -f *.afm *.tfm pdftex.map

