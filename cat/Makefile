CC=gcc
CFLAGS=-Wall -Wextra -Werror -c
COMMON = ../common/

all: build clean
build: cat

cat: cat.o TablesCat.o 
	$(CC) cat.o TablesCat.o -o cat

cat.o: cat.c
	$(CC) $(CFLAGS) cat.c

TablesCat.o: TablesCat.c
	$(CC) $(CFLAGS) TablesCat.c

clean:
	rm -rf *.o 
