CC = gcc
CFLAGS = -std=c99 -g -Wall -fsanitize=address,undefined

memtest: memtest.o mymalloc.o
		$(CC) $(CFLAGS) memtest.o mymalloc.o -o memtest

mymalloc.o: mymalloc.c mymalloc.h
		$(CC) $(CFLAGS) -c mymalloc.c

memtest.o: memtest.c mymalloc.h
		$(CC) $(CFLAGS) -c memtest.c

memgrind.o: memgrind.c mymalloc.h
		$(CC) $(CFLAGS) -c memgrind.o

clean:
		rm -f *.0 memtest