SOURCES = src/main.hs src/KNN/Dist.hs src/KNN/Sort.hs

all: $(SOURCES)
	ghc --make -Wall $^

run: $(SOURCES)
	cd src; runhaskell main.hs

clean:
	rm src/main
	rm src/*.hi src/*.o
	rm src/KNN/*.hi src/KNN/*.o
