#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>
#include <sys/wait.h>
#include <time.h>

#define NUM_EXCHANGES 100000

int main() {
    int pipe1[2]; // Parent writes, child reads
    int pipe2[2]; // Child writes, parent reads

    if (pipe(pipe1) < 0 || pipe(pipe2) < 0) {
        perror("pipe");
        exit(1);
    }

    pid_t pid = fork();
    if (pid < 0) {
        perror("fork");
        exit(1);
    }

    if (pid == 0) {
        // ---- CHILD PROCESS ----
        close(pipe1[1]); // Close write end of pipe1
        close(pipe2[0]); // Close read end of pipe2

        char byte;
        for (int i = 0; i < NUM_EXCHANGES; i++) {
            // Read byte from parent
            if (read(pipe1[0], &byte, 1) != 1) {
                perror("child read");
                exit(1);
            }
            // Send byte back to parent
            if (write(pipe2[1], &byte, 1) != 1) {
                perror("child write");
                exit(1);
            }
        }

        close(pipe1[0]);
        close(pipe2[1]);
        exit(0);

    } else {
        // ---- PARENT PROCESS ----
        close(pipe1[0]); // Close read end of pipe1
        close(pipe2[1]); // Close write end of pipe2

        char byte = 0x42; // Arbitrary byte to ping-pong
        struct timespec start, end;

        clock_gettime(CLOCK_MONOTONIC, &start);

        for (int i = 0; i < NUM_EXCHANGES; i++) {
            // Send byte to child
            if (write(pipe1[1], &byte, 1) != 1) {
                perror("parent write");
                exit(1);
            }
            // Read byte back from child
            if (read(pipe2[0], &byte, 1) != 1) {
                perror("parent read");
                exit(1);
            }
        }

        clock_gettime(CLOCK_MONOTONIC, &end);

        close(pipe1[1]);
        close(pipe2[0]);

        wait(NULL); // Wait for child to finish

        // Calculate elapsed time in seconds
        double elapsed = (end.tv_sec - start.tv_sec)
                       + (end.tv_nsec - start.tv_nsec) / 1e9;

        double exchanges_per_sec = NUM_EXCHANGES / elapsed;

        printf("Exchanges:          %d\n", NUM_EXCHANGES);
        printf("Total time:         %.4f seconds\n", elapsed);
        printf("Exchanges/second:   %.2f\n", exchanges_per_sec);
        printf("Avg latency/exchange: %.2f microseconds\n",
               (elapsed / NUM_EXCHANGES) * 1e6);
    }

    return 0;
}
