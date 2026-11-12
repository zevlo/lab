#include <stdio.h>

int main() {
    // Declaring an integer array with 5 elements
    int numbers[5] = {10, 20, 30, 40, 50};

    // Printing array elements
    printf("Array elements:\n");
    for (int i = 0; i < 5; i++) {
        printf("numbers[%d] = %d\n", i, numbers[i]);
    }

    return 0;
}