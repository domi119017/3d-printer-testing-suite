OPENSCAD_PATH:=/usr/bin/openscad
ifeq ($(OS),Windows_NT)
	OPENSCAD_PATH:="C:/Program Files/OpenSCAD/openscad.com"
endif

ROOT_DIR:=$(shell dirname $(realpath $(firstword $(MAKEFILE_LIST))))

SRCDIR:=$(ROOT_DIR)/src
SETUPDIR:=$(SRCDIR)/setups

BUILDDIR:=$(ROOT_DIR)/build
STLDIR:=$(BUILDDIR)/stl
IMGDIR:=$(BUILDDIR)/img

MAINFILE:=$(SRCDIR)/3d-printer-testing-suite.scad
NOSTL:= cover support-underside text_width_scaling text_width_scaling_small text_width_scaling_big

SETUPFILES:=$(wildcard $(SETUPDIR)/*.scad)
STLFILESUNFILTERED:=$(patsubst $(SETUPDIR)/%.scad,$(STLDIR)/%.stl,$(SETUPFILES))
STLFILES:=$(filter-out $(patsubst %,$(STLDIR)/%.stl,$(NOSTL)),$(STLFILESUNFILTERED))
IMGFILES:=$(patsubst $(SETUPDIR)/%.scad,$(IMGDIR)/%.png,$(SETUPFILES))

COMMONARGS:=
STLARGS:=--export-format binstl
IMGARGS:=--autocenter --viewall --projection o --colorscheme BeforeDawn

all: IMGARGS+=--imgsize 1920,1440
all: mkbuilddir stl img combined

rebuild: clean all

preview: COMMONARGS+=-D preview_mode=true
preview: IMGARGS+=--imgsize 960,720
preview: cleanimg mkbuilddir img

stl: ${STLFILES}

cleanstl:
	rm -rf $(STLDIR)

img: ${IMGFILES}

cleanimg:
	rm -rf $(IMGDIR)

combined:
	python $(ROOT_DIR)/openscad-projects/combine.py $(MAINFILE) > $(BUILDDIR)/combined.scad

${STLDIR}/%.stl: ${SETUPDIR}/%.scad
	$(OPENSCAD_PATH) -o $@ $(COMMONARGS) $(STLARGS) $<

${IMGDIR}/%.png: ${SETUPDIR}/%.scad
	$(OPENSCAD_PATH) -o $@ $(COMMONARGS) $(IMGARGS) $<

${BUILDDIR}/%.ast : ${SRCDIR}/%.scad
	$(OPENSCAD_PATH) -o $@ $(COMMONARGS) $<

clean:
	rm -rf $(BUILDDIR)/*

mkbuilddir:
	mkdir -p $(STLDIR)
	mkdir -p $(IMGDIR)

version:
	make --version
	$(OPENSCAD_PATH) --version

help:
	@echo "Usage: make [all|stl|img|clean|mkbuilddir|version|help]"
	@echo "  all:           Generate STL and PNG files"
	@echo "  rebuild:       Clean and generate STL and PNG files"
	@echo "  preview:       Clean img & generate preview PNG files"
	@echo "  stl:           Generate STL files"
	@echo "  img:           Generate PNG files"
	@echo "  ast:           Generate Abstract syntax tree"
	@echo "  clean:         Remove build directory"
	@echo "  cleanstl:      Remove only STL files"
	@echo "  cleanimg:      Remove only PNG files"
	@echo "  cleanast:      Remove only AST files"
	@echo "  mkbuilddir:    Create build directory"
	@echo "  version:       Show Make & OpenSCAD version"
	@echo "  help:          Show this help message and OpenSCAD help"
	@echo ""
	@echo "Openscad Help:"
	@$(OPENSCAD_PATH) --help


.PHONY: all rebuild preview stl cleanstl img cleanimg ast cleanast mkbuilddir version help