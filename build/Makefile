PYTHON_VERSION = '2.7.10'
VIRTUALENV_BIN = $(shell python -c "import sys;print('virtualenv'+('' if sys.version_info.major==2 else '2'))")
INFO_DIR = '/usr/share/info'

default: python.info

python.tgz:
	wget -O python.tgz http://www.python.org/ftp/python/$(PYTHON_VERSION)/Python-$(PYTHON_VERSION).tgz

python_src: python.tgz
	tar -xzf python.tgz
	mv Python-$(PYTHON_VERSION) python_src
	# based on http://stackoverflow.com/a/3952588
	echo "texinfo_documents = [('contents', 'python', 'Python Documentation', 'Georg Brandl', 'Python', 'The Python Programming Language', 'Documentation tools', 1)]" >> python_src/Doc/conf.py

sphinx_env:
	$(VIRTUALENV_BIN) sphinx_env

sphinx_env3:
	# https://stackoverflow.com/a/30233408/1219634
	python3 -m venv sphinx_env3

sphinx_build: sphinx_env
	sphinx_env/bin/pip install sphinx==1.3.3

sphinx_build3: sphinx_env3
	sphinx_env3/bin/pip3 install sphinx==1.6.3

python.texi: python_src sphinx_build
	sphinx_env/bin/sphinx-build -b texinfo python_src/Doc python_info
	cp python_info/python.texi python.texi
	sed -i 's/@dircategory Documentation tools/@dircategory Programming/g' python.texi

python3.texi: python_src sphinx_build3
	sphinx_env3/bin/sphinx-build -b texinfo python_src/Doc python3_info
	cp python3_info/python.texi python3.texi
	sed -i -e 's/@dircategory Documentation tools/@dircategory Programming/g' -e 's/@settitle Python Documentation/@settitle Python 3 Documentation/g' -e 's/@title Python Documentation/@title Python 3 Documentation/g' -e 's/@top Python Documentation/@top Python 3 Documentation/g' -e 's/python\.info/python3.info/g' -e 's/^\* Python:/* Python 3:/g' python3.texi

python.info: python.texi
	makeinfo --no-split python.texi

python3.info: python3.texi
	makeinfo --no-split python3.texi

clean:
	rm -f python.tgz
	rm -rf python_src
	rm -rf python_info
	rm -rf python3_info
	rm -rf sphinx_env
	rm -rf sphinx_env3
	rm -f python.texi
	rm -f python3.texi

install: python.info
	mkdir -p $(INFO_DIR)
	cp python.info $(INFO_DIR)/.
	install-info --info-dir=$(INFO_DIR) $(INFO_DIR)/python.info

install3: python3.info
	mkdir -p $(INFO_DIR)
	cp python3.info $(INFO_DIR)/.
	install-info --info-dir=$(INFO_DIR) $(INFO_DIR)/python3.info

# To install Python 3.6.1 documentation as an Info manual:
#   make install3 PYTHON_VERSION=3.6.1 INFO_DIR=/path/to/my/info/dir
