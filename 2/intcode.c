#include <stdio.h>
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
	int done = 0;
	while (done == 0) {
	// printf("[%d] interpreting: %d, %d, %d, %d\n", opidx, program[opidx], program[opidx+1], program[opidx+2], program[opidx+3]);
	switch (program[opidx]) {
		case ADD:
			program[program[opidx+3]] = program[program[opidx+1]] + program[program[opidx+2]];
			break;
		case MUL:
			program[program[opidx+3]] = program[program[opidx+1]] * program[program[opidx+2]];
			break;
		case HALT:
			done = 1;
			break;
	}
	opidx += 4;
	}
}
