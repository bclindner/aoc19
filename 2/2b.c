#include <stdio.h>;
#include "intcode.h";

int main() {
	// Read in whole program
	long baseprogram[4096];
	int prglen = read_intcode_from_stdin(&baseprogram);
	for (int i = 0; i<100; i++) {
		for (int j=0; j<100; j++) {
			long program[4096];
			for (int k=0; k<4096; k++) {
				program[k] = baseprogram[k];
			}
			program[1] = i;
			program[2] = j;
			execute_intcode(&program);
			if (program[0] == 19690720) {
				printf("found match! noun=%d, verb=%d\nanswer=%d\n", i, j, 100 * i + j);
				return 0;
			}
		}
	}
	printf("no matches found\n");
	return 1;
}
