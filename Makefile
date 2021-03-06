CC=gcc
CFLAGS=-Wall -Wextra -Werror -pedantic -ansi -g -msse -std=c99

all : udp.o signal_handler.o server client

udp.o : udp.c
	$(CC) -c $(CFLAGS) udp.c -o udp.o

signal_handler.o : signal_handler.c
	$(CC) -c $(CFLAGS) signal_handler.c -o signal_handler.o

.PHONY: server
server :
	$(MAKE) -C server $(MFLAGS)

.PHONY: client
client :
	$(MAKE) -C client $(MFLAGS)

.PHONY: clean
clean :
	$(MAKE) -C server $(MFLAGS) clean
	$(MAKE) -C client $(MFLAGS) clean
	rm -rf *.o
