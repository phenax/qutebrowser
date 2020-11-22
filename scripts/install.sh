#!/usr/bin/env bash

# sudo pip install -U setuptools wheel
# sudo pip install -r misc/requirements/requirements-pyqt.txt --only-binary PyQt5,PyQtWebEngine
# sudo pip install -r requirements.txt
# yay -S python-pypeg2 python-pygments python-markupsafe python-jinja python-attrs python-pyqt5 python-pyqt5-sip python-pyqtwebengine

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


### REMOVE
# sudo pip uninstall pyqt5 pyqtwebengine pypeg2 attrs markupsafe pyqt5-sip pygments
# sudo pip uninstall qutebrowser

