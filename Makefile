OPENSCAD_PATH:=/usr/bin/openscad
ifeq ($(OS),Windows_NT)
	OPENSCAD_PATH:="C:/Program Files/OpenSCAD/openscad.com"
endif
ROOT_DIR:=$(shell dirname $(realpath $(firstword $(MAKEFILE_LIST))))
SRCDIR:=$(ROOT_DIR)/src
BUILDDIR:=$(ROOT_DIR)/build
STLDIR:=$(BUILDDIR)/stl
IMGDIR:=$(BUILDDIR)/img

SCADFILES:=$(wildcard $(SRCDIR)/*.scad)
STLFILES:=$(patsubst $(SRCDIR)/%.scad,$(STLDIR)/%.stl,$(SCADFILES))
IMGFILES:=$(patsubst $(SRCDIR)/%.scad,$(IMGDIR)/%.png,$(SCADFILES))

COMMONARGS:=
STLARGS:=--export-format binstl
IMGARGS:=--autocenter --viewall --projection o --colorscheme BeforeDawn

all: IMGARGS+=--imgsize 1920,1440
all: mkbuilddir stl img

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

${STLDIR}/%.stl: ${SRCDIR}/%.scad
	$(OPENSCAD_PATH) -o $@ $(COMMONARGS) $(STLARGS) $<

${IMGDIR}/%.png: ${SRCDIR}/%.scad
	$(OPENSCAD_PATH) -o $@ $(COMMONARGS) $(IMGARGS) $<

clean: cleanstl cleanimg

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
	@echo "  clean:         Remove build directory"
	@echo "  cleanstl:      Remove only STL files"
	@echo "  cleanimg:      Remove only PNG files"
	@echo "  mkbuilddir:    Create build directory"
	@echo "  version:       Show Make & OpenSCAD version"
	@echo "  help:          Show this help message and OpenSCAD help"
	@echo ""
	@echo "Openscad Help:"
	@$(OPENSCAD_PATH) --help


.PHONY: all rebuild preview stl cleanstl img cleanimg mkbuilddir version help