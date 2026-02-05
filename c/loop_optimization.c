#include <stdio.h>
#include <time.h>

#define ARRAY_SIZE 10000

// Function to calculate sum using traditional loop
int traditional_sum(int arr[], int size) {
    int sum = 0;
    for (int i = 0; i < size; i++) {
        sum += arr[i];
    }
    return sum;
}

// Function to calculate sum using optimized loop
int optimized_sum(int arr[], int size) {
    int sum1 = 0, sum2 = 0, sum3 = 0, sum4 = 0;

    // Loop unrolling technique
    int i;
    for (i = 0; i + 4 < size; i += 4) {
        sum1 += arr[i];
        sum2 += arr[i + 1];
        sum3 += arr[i + 2];
        sum4 += arr[i + 3];
    }

    // Handle remaining elements
    for (; i < size; i++) {
        sum1 += arr[i];
    }

    return sum1 + sum2 + sum3 + sum4;
}

int main() {
    int arr[ARRAY_SIZE];
    clock_t start, end;
    double cpu_time_used;

    // Initialize array
    for (int i = 0; i < ARRAY_SIZE; i++) {
        arr[i] = i + 1;
    }

    // Traditional sum
    start = clock();
    int traditional_result = traditional_sum(arr, ARRAY_SIZE);
    end = clock();
    cpu_time_used = ((double) (end - start)) / CLOCKS_PER_SEC;
    printf("Traditional Sum: %d\n", traditional_result);
    printf("Traditional Loop Time: %f seconds\n", cpu_time_used);

    // Optimized sum
    start = clock();
    int optimized_result = optimized_sum(arr, ARRAY_SIZE);
    end = clock();
    cpu_time_used = ((double) (end - start)) / CLOCKS_PER_SEC;
    printf("Optimized Sum: %d\n", optimized_result);
    printf("Optimized Loop Time: %f seconds\n", cpu_time_used);

    return 0;
}
