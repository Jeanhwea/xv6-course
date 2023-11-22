#include <stdio.h>
#include <stdlib.h>
#include <sys/types.h>
#include <sys/wait.h>
#include <unistd.h>
#include <pthread.h>

#define NUM_THREADS 5

int count = 0;

void *run(void *t)
{
	for (int i = 0; i < 100000; ++i) {
		count++;
	}
	pthread_exit(NULL);
}

int main()
{
	pthread_t threads[NUM_THREADS];
	int rc;
	int t;
	void *result;

	for (t = 0; t < NUM_THREADS; t++) {
		rc = pthread_create(&threads[t], NULL, run, (void *)t);
		if (rc) {
			printf("pthread_create() fails with code=%d\n", rc);
			exit(-1);
		}
	}

	for (t = 0; t < NUM_THREADS; t++) {
		rc = pthread_join(threads[t], &result);
		if (rc) {
			printf("pthread_join() fails with code=%d\n", rc);
			exit(-1);
		}
	}

	printf("Main: count=%d\n", count);
	return 0;
}
