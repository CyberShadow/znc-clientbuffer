PREFIX ?= /usr/local
LIBDIR ?= /lib

all: clientbuffer.so

clientbuffer.so : clientbuffer.cpp $(PREFIX)/bin/znc-buildmod
	$(PREFIX)/bin/znc-buildmod clientbuffer.cpp

clean:
	rm -f clientbuffer.so

install: clientbuffer.so
	install -Dm 755 clientbuffer.so $(DESTDIR)$(PREFIX)$(LIBDIR)/znc/clientbuffer.so

$(PREFIX)/bin/znc-buildmod :
	@echo "Did not find a znc-buildmod binary at $(PREFIX)/bin/znc-buildmod."
	@echo "Is PREFIX corretly set? ($(PREFIX))"
	@if [ "$(PREFIX)" = /usr ] ; then echo "Maybe try rerunning with PREFIX=/usr/local" ; fi
	@if [ "$(PREFIX)" = /usr/local ] ; then echo "Maybe try rerunning with PREFIX=/usr" ; fi
	@exit 1
