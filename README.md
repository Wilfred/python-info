# Python Info Manuals

This is a simple Emacs package to provide an info manual for
Python.

To install, you need to be using [MELPA](http://melpa.milkbox.net/)
then simply `M-x package-install RET python-info`.

### Updating python.texi

To run the makefile, you will need virtualenv and Python 2, then simply:

    $ cd build
    $ make

This will create `build/python.texi`.

## Licensing

This is really just a makefile, which is licensed under the BSD
license (see COPYING). The Python info files are under the
[PSF license](http://docs.python.org/2/license.html).

## Other Projects

[pylookup](https://github.com/tsgates/pylookup) is also excellent if
you're looking for searching Python docs.
