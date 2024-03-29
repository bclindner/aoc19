#include <stdio.h>
#include "intcode.h"

// A simple Intcode parser. Returns the first number.
int main() {
	// Read in whole program
	long program[4096];
	read_intcode_from_stdin(program);
	execute_intcode(program);
	// print the final output
	printf("%ld\n", program[0]);
	return 0;
}
