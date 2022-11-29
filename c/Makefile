CFLAGS=-Wall -O3
CC=gcc

# build with make LENGTH=yourNumber
# e.g.: make LENGTH=15 
default:
	$(CC) $(CFLAGS) -Dkmer_length=$(LENGTH) main.c -o c
	$(info C)
	c
