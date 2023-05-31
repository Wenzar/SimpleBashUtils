CC=gcc
CFLAGS=-Wall -Wextra -Werror -c


all: build clean
build: grep

grep: grep.o 
	$(CC) grep.o -o grep

grep.o: grep.c
	$(CC) $(CFLAGS) grep.c

clean:
	rm -rf *.o 
