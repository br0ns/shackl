
shackl: src/*
	mlton -output bin/shackl src/shackl.mlb

install:
	install bin/shackl $(DESTDIR)/bin