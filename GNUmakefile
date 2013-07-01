SOURCES = src/main.hs src/dists.hs src/sort.hs

all: $(SOURCES)
	ghc --make -Wall $^
	mv src/main .

run: $(SOURCES)
	runhaskell $^

clean:
	rm src/*.hi src/*.o
