#include <stdio.h>

extern void encrypt(char *input, char key[26], char *output);

int main(){
	char *input = "abcdefghijklmnopqrstuvwxyz";
	char key[26] = "DKVQFIBJWPESCXHTMYAUOLRGZN";
	char output[26];
	
	encrypt (input, key, output );
	
	printf("%s -> %s\n", input, output);
	return 0;
}