all: install

install:
	ln -s ~/.stumpwm.d/init.lisp ~/.stumpwmrc
	git submodule init
	git submodule update
