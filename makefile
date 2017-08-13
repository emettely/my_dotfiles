.PHONY: all

all: common not-common

common:
	echo "copying over common files"
#	cp .zshrc ~/.zshrc
	cp .spacemacs ~/.spacemacs
	cp -r .emacs.d ~/.emacs.d
	cp -r bin/* ~/bin/

not-common:
	echo "copying over not so common files"
