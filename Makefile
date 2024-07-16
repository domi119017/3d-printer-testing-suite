OPENSCAD_PATH:=/usr/bin/openscad
ifeq ($(OS),Windows_NT)
	OPENSCAD_PATH:="C:/Program Files/OpenSCAD/openscad.com"
endif
ROOT_DIR:=$(shell dirname $(realpath $(firstword $(MAKEFILE_LIST))))
SRCDIR:=$(ROOT_DIR)/src
STLDIR:=$(ROOT_DIR)/stl
IMGDIR:=$(ROOT_DIR)/img

SCADFILES:=$(wildcard $(SRCDIR)/*.scad)
STLFILES:=$(patsubst $(SRCDIR)/%.scad,$(STLDIR)/%.stl,$(SCADFILES))
IMGFILES:=$(patsubst $(SRCDIR)/%.scad,$(IMGDIR)/%.png,$(SCADFILES))

all: clean stl img

stl: ${STLFILES}

img: ${IMGFILES}

${STLDIR}/%.stl: ${SRCDIR}/%.scad
	$(OPENSCAD_PATH) -o $@ $<

${IMGDIR}/%.png: ${SRCDIR}/%.scad
	$(OPENSCAD_PATH) -o $@ $<

clean:
	rm -f ${STLFILES}

.PHONY: all clean