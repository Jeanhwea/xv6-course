#include <assert.h>
#include <stdio.h>
#include <stdlib.h>
#include <sys/types.h>
#include <sys/wait.h>
#include <unistd.h>
#include <pthread.h>

#define NUM_THREADS 5

int count;

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

	// create threads
	for (t = 0; t < NUM_THREADS; t++) {
		rc = pthread_create(&threads[t], NULL, run, (void *)t);
		assert(rc == 0);
	}

	// join threads
	for (t = 0; t < NUM_THREADS; t++) {
		rc = pthread_join(threads[t], &result);
		assert(rc == 0);
	}

	// print result
	printf("Main: count=%d\n", count);
	return 0;
}