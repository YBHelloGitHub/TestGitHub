all:
	gcc -Wall -g -o main main.c

.PHONY clean:
	rm main
