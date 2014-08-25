all:
	gcc -Wall -g -o main main.c

# 不是真正的目标，是伪目标.
.PHONY clean: main
	rm $^
