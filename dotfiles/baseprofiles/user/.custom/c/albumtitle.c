#include <stdio.h>
#include <stdlib.h>

#define MAX_BUFFER_SIZE 1024

int main() {
	//open pipe
	FILE *fp = popen("playerctl -p spotify metadata album", "r");

	if (fp == NULL) {
		fprintf(stderr, "pipe not opened.\n");
		return EXIT_FAILURE;
	}

	char buffer[MAX_BUFFER_SIZE];
	if (fgets(buffer, MAX_BUFFER_SIZE, fp) != NULL) {
		//print
		printf("current album: %s", buffer);
	} else {
		fprintf(stderr, "error reading from pipe.\n");
	}

	pclose(fp);

	return EXIT_SUCCESS;
}
	
