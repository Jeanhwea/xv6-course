IMG_DIR := img

DOTS    := $(shell find $(IMG_DIR) -name *.dot)
PDFS    := $(DOTS:%=%.pdf)


all: build images

images: $(PDFS)
	echo $(PDFS)

%.dot.pdf: %.dot
	dot -Tpdf $< -o $@

build:
	make -C lab

clean:
	make -C lab clean

init:
	bear -- make -C lab

publish:
	git push github master
	git push gitee master
	git push github --tags
	git push gitee --tags

.PHONY: all build images clean init publish
