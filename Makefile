
shackl: src/*
	mlton src/shackl.mlb
	mv src/shackl bin

install:
	install bin/shackl $(DESTDIR)/bin