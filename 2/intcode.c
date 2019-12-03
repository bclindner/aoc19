#include <stdio.h>
#include <stdbool.h>
#include <stdlib.h>

enum ops {
	ADD = 1,
	MUL = 2,
	HALT = 99
};

// Reads an Intcode string from stdin into the specified array.
// Returns the length of the program.
int read_intcode_from_stdin(long program[]){
	int prglen;
	char codebuf[16];
	int cbidx;
	char ch;
	// Read in whole program
	while((ch = getchar())) {
	switch (ch) {
		case ',':
		case EOF:
		// printf("adding %s to program as %d\n", codebuf, atol(codebuf));
		// add to the program
		program[prglen] = atol(codebuf);
		prglen++;
		// reset the codebuf array
		cbidx = 0;
		for(int i=0; i<4; i++){
			codebuf[i] = '\0';
		}
		break;
		default:
		// printf("adding %c to codebuf\n", ch);
		// add to the codebuf array
		codebuf[cbidx] = ch;
		cbidx++;
		break;
	}
	if (ch == EOF) {
		break;
	}
	}
	return prglen;
}

void execute_intcode(long program[]){
	// execute the program:
	int opidx = 0;
	while (true) {
  long opcode = program[opidx++];
  long op1idx = program[opidx++];
  long op2idx = program[opidx++];
  long destidx = program[opidx++];
	// printf("[%d] interpreting: %ld, %ld, %ld, %ld\n", opidx - 4, opcode, opparam1, opparam2, program[destidx]);
	switch (opcode) {
		case ADD:
			program[destidx] = program[op1idx] + program[op2idx];
			break;
		case MUL:
			program[destidx] = program[op1idx] * program[op2idx];
			break;
		case HALT:
      return;
	}
	}
}
