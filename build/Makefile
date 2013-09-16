
default: python_texinfo

python.tgz:
	wget -O python.tgz http://www.python.org/ftp/python/2.7.5/Python-2.7.5.tgz

python_src: python.tgz
	tar -xzf python.tgz
	mv Python-2.7.5 python_src
	# based on http://stackoverflow.com/a/3952588
	echo "texinfo_documents = [('contents', 'python', 'Python Documentation', 'Georg Brandl', 'Python', 'The Python Programming Language', 'Documentation tools', 1)]" >> python_src/Doc/conf.py

sphinx_env:
	virtualenv sphinx_env

sphinx-build: sphinx_env
	sphinx_env/bin/pip install sphinx==1.1.3

python_texinfo: python_src sphinx-build
	sphinx_env/bin/sphinx-build -b texinfo python_src/Doc python_info
	sed -i 's/@dircategory Documentation tools/@dircategory Programming/g' python_info/python.texi
	cp python_info/python.texi python.texi

clean:
	rm -f python.tgz
	rm -rf python_src
	rm -rf python_info
	rm -rf sphinx_env
	rm -f python.texi
