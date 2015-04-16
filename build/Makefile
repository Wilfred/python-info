PYTHON_VERSION = '2.7.8'
VIRTUALENV_BIN = $(shell python -c "import sys;print('virtualenv'+('' if sys.version_info.major==2 else '2'))")
 
default: python_texinfo

python.tgz:
	wget -O python.tgz http://www.python.org/ftp/python/$(PYTHON_VERSION)/Python-$(PYTHON_VERSION).tgz

python_src: python.tgz
	tar -xzf python.tgz
	mv Python-$(PYTHON_VERSION) python_src
	# based on http://stackoverflow.com/a/3952588
	echo "texinfo_documents = [('contents', 'python', 'Python Documentation', 'Georg Brandl', 'Python', 'The Python Programming Language', 'Documentation tools', 1)]" >> python_src/Doc/conf.py

sphinx_env:
	$(VIRTUALENV_BIN) sphinx_env

sphinx-build: sphinx_env
	sphinx_env/bin/pip install sphinx==1.1.3

python_info: python_src sphinx-build
	sphinx_env/bin/sphinx-build -b texinfo python_src/Doc python_info

python.texi: python_info python_info/python.texi Makefile
	sed -e 's/@dircategory Documentation tools/@dircategory Programming/g' \
		python_info/python.texi > $@

.PHONY: python_texinfo
python_texinfo: python.texi

clean:
	rm -f python.tgz
	rm -rf python_src
	rm -rf python_info
	rm -rf sphinx_env
	rm -f python.texi
	rm -f python.info

python.info: python.texi
	makeinfo --no-split python.texi

install: python.info
	cp $< /usr/share/info
	install-info --info-dir=/usr/share/info python.info
