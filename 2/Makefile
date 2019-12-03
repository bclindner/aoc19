all: clean 2a 2b

2a: 2a.c intcode.c intcode.h
	gcc -std=c99 -pedantic -o 2a intcode.c 2a.c
2b: 2b.c intcode.c intcode.h
	gcc -std=c99 -pedantic -o 2b intcode.c 2b.c
clean:
	-rm 2a 2b
