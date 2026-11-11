#include <stdio.h>

int main() {
    printf("Counting from 1 to 5 using a for loop:\n");
    for (int i = 1; i <= 5; i++) {
        printf("%d ", i);
    }
    printf("\n");

    int count = 1;
    printf("Counting from 1 to 5 using a while loop:\n");
    while (count <= 5) {
        printf("%d ", count);
        count++;
    }
    printf("\n");

    count = 1;
    printf("Counting from 1 to 5 using a do-while loop:\n");
    do {
        printf("%d ", count);
        count++;
    } while (count <= 5);
    printf("\n");

    return 0;
}