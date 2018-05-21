Electrum-DSR - Lightweight Desire client
=====================================

::

  Licence: MIT Licence
  Author: Thomas Voegtlin
  Language: Python
  Homepage: https://electrum-desire.org/


.. image:: https://travis-ci.org/akhavr/electrum-desire.svg?branch=develop
    :target: https://travis-ci.org/akhavr/electrum-desire
    :alt: Build Status





Getting started
===============

Electrum-DSR is a pure python application. If you want to use the
Qt interface, install the Qt dependencies::

    sudo apt-get install python-qt4

If you downloaded the official package (tar.gz), you can run
Electrum-DSR from its root directory, without installing it on your
system; all the python dependencies are included in the 'packages'
directory. To run Electrum-DSR from its root directory, just do::

    ./electrum-desire

You can also install Electrum-DSR on your system, by running this command::

    python setup.py install

This will download and install the Python dependencies used by
Electrum-DSR, instead of using the 'packages' directory.

If you cloned the git repository, you need to compile extra files
before you can run Electrum-DSR. Read the next section, "Development
Version".



Development version
===================

Check out the code from Github::

    git clone https://github.com/akhavr/electrum-desire
    cd electrum-desire

Run install (this should install dependencies)::

    python setup.py install

Compile the icons file for Qt::

    sudo apt-get install pyqt4-dev-tools
    pyrcc4 icons.qrc -o gui/qt/icons_rc.py

Compile the protobuf description file::

    sudo apt-get install protobuf-compiler
    protoc --proto_path=lib/ --python_out=lib/ lib/paymentrequest.proto

Create translations (optional)::

    sudo apt-get install python-pycurl gettext
    ./contrib/make_locale




Creating Binaries
=================


To create binaries, create the 'packages' directory::

    ./contrib/make_packages

This directory contains the python dependencies used by Electrum.

Mac OS X
--------

::

    # On MacPorts installs:
    sudo python setup-release.py py2app

    # On Homebrew installs:
    ARCHFLAGS="-arch i386 -arch x86_64" sudo python setup-release.py py2app --includes sip

    sudo hdiutil create -fs HFS+ -volname "Electrum" -srcfolder dist/Electrum.app dist/electrum-VERSION-macosx.dmg

Windows
-------

See `contrib/build-wine/README` file.


Android
-------

See `gui/kivy/Readme.txt` file.
