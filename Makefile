
shackl: src/*
	mlton src/shackl.mlb
	mv src/shackl .

install:
	install shackl $(DESTDIR)/bin