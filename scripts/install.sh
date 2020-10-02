#!/usr/bin/env bash

build() {
    python scripts/asciidoc2html.py && \
    a2x -f manpage doc/qutebrowser.1.asciidoc && \
    python setup.py build;
}

package() {
    sudo make -f misc/Makefile PREFIX=/usr install;
}

cleanup() {
    rm doc/*.1;
}

build && package && cleanup;
