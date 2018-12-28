all: install

install:
	ln -s init.lisp ~/.stumpwmrc
	git submodule init
	git submodule update
