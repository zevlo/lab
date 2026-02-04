#include <stdio.h>

int main() {
    // Declare and initialize an array of student grades
    int grades[5] = {85, 92, 78, 90, 88};

    // Accessing individual array elements
    printf("First grade (index 0): %d\n", grades[0]);
    printf("Third grade (index 2): %d\n", grades[2]);

    // Modifying array elements
    printf("\nBefore modification:\n");
    for (int i = 0; i < 5; i++) {
        printf("grades[%d] = %d\n", i, grades[i]);
    }

    // Modify a specific element
    grades[1] = 95;  // Change the second grade
    grades[4] = 87;  // Change the last grade

    printf("\nAfter modification:\n");
    for (int i = 0; i < 5; i++) {
        printf("grades[%d] = %d\n", i, grades[i]);
    }

    // Calculate average grade
    int total = 0;
    for (int i = 0; i < 5; i++) {
        total += grades[i];
    }
    float average = (float)total / 5;
    printf("\nAverage grade: %.2f\n", average);

    return 0;
}
