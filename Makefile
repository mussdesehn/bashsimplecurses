SHELL=bash
PREFIX ?= /usr/local
LIBDIR ?= $(DESTDIR)$(PREFIX)/lib

VERSION=1.4


all: test
	@echo "If no error was displayed, you can run 'make install'"

help:
	@echo ""
	@echo "Usage: make [test|install|uninstall] [LIBDIR=path]"
	@echo ""
	@echo "Run 'make test'. If everything is OK, run 'make install' as root."
	@echo "You can set LIBDIR to a valid directory. Default is $(LIBDIR)"
	@echo ""
	@echo "You can uninstall Bash Simple Curses by running 'make uninstall' as root."
	@echo ""

install:
	@echo "Installing..."
	@mkdir -p $(LIBDIR)
	install -m655 simple_curses.sh $(LIBDIR)/simple_curses.sh
	@echo "done"

uninstall:
	@echo "Removing..."
	rm -rf $(LIBDIR)/simple_curses.sh
	@echo "done"

test:
	@echo "Checking if img2txt is installed"
	@which img2txt > /dev/null && echo -e "\033[32mOk\033[0m - you can use img2txt command to display images on window" || echo -e "\033[33mWarning\033[0m - You should install caca-utils or img2txt command"

dist:
	rm -rf ./bashsimplecurses-$(VERSION)
	mkdir ./bashsimplecurses-$(VERSION)
	cp README.md README
	cp LICENSE README AUTHORS INSTALL simple_curses.sh Makefile ./bashsimplecurses-$(VERSION)
	tar cvfz bashsimplecurses-$(VERSION).tar.gz ./bashsimplecurses-$(VERSION)
	rm -rf ./bashsimplecurses-$(VERSION)
	@echo "bashsimplecurses-$(VERSION).tar.gz done"
	rm -f README
