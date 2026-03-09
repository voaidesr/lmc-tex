LATEXMK ?= latexmk
TEX := master.tex
BUILD_DIR := build
LATEXMK_FLAGS := -pdf -interaction=nonstopmode -file-line-error -halt-on-error -outdir=$(BUILD_DIR) -auxdir=$(BUILD_DIR)

.PHONY: all pdf watch clean distclean

all: pdf

pdf: $(BUILD_DIR)
	$(LATEXMK) $(LATEXMK_FLAGS) $(TEX)

watch: $(BUILD_DIR)
	$(LATEXMK) -pvc $(LATEXMK_FLAGS) $(TEX)

clean:
	$(LATEXMK) -c $(TEX)
	rm -f $(BUILD_DIR)/*.bbl $(BUILD_DIR)/*.bcf $(BUILD_DIR)/*.run.xml

distclean:
	$(LATEXMK) -C $(TEX)
	rm -rf $(BUILD_DIR)

$(BUILD_DIR):
	mkdir -p $(BUILD_DIR)
