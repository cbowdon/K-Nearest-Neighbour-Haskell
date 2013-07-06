SOURCES = src/main.hs src/dists.hs src/sort.hs

all: $(SOURCES)
	ghc --make -Wall $^
	mv src/main .

run: $(SOURCES)
	./main

clean:
	rm src/*.hi src/*.o
