# K Nearest Neighbour in Haskell (a.k.a. babby's first Haskell)

Having spent some time with Typed Racket, I decided to try my hand at Haskell. I chose to tackle KNN because it's fairly simple and I'm familiar with it.

Long story short, Haskell is great. I particularly like the partial application of functions - in Racket this would require a call to curry, a lambda or a macro, but in Haskell you can just throw them around with almost no extra syntax. Overall the code feels a lot cleaner than the TR equivalent and just looks less dense. 

### Post completion update:
+ Implementing quickselect was unnecessary (surely there's a better nth-element sort in a library somewhere) but good for getting to grips with Haskell.
+ No unit tests, decided learning a new testing framework and language at the same time might be too much.
+ Still not sure how idiomatic this is.
