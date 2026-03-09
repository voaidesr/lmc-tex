LATEXMK ?= latexmk
TEX := master.tex
BUILD_DIR := build
LATEXMK_FLAGS := -pdf -interaction=nonstopmode -file-line-error -halt-on-error -outdir=$(BUILD_DIR)

.PHONY: build watch section clean

build:
	mkdir -p $(BUILD_DIR)
	$(LATEXMK) $(LATEXMK_FLAGS) $(TEX)

watch:
	mkdir -p $(BUILD_DIR)
	$(LATEXMK) -pvc $(LATEXMK_FLAGS) $(TEX)

section:
ifndef SECTION
	$(error Missing SECTION. Use: make section SECTION=t1)
endif
	mkdir -p $(BUILD_DIR)
	$(LATEXMK) $(LATEXMK_FLAGS) -jobname=$(SECTION) -pdflatex='pdflatex %O "\\def\\OnlySection{$(SECTION)}\\input{%S}"' $(TEX)

clean:
	rm -rf $(BUILD_DIR)
