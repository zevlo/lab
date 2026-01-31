#include <stdio.h>

int main() {
    // Direct initialization
    int studentCount = 25;

    // Separate declaration and initialization
    float averageScore;
    averageScore = 85.5;

    // Multiple variable initialization
    int x = 10, y = 20, sum;
    sum = x + y;

    // Constant variable
    const float PI = 3.14159;

    // Printing initialized variables
    printf("Student Count: %d\n", studentCount);
    printf("Average Score: %.1f\n", averageScore);
    printf("Sum of x and y: %d\n", sum);
    printf("Constant PI: %.5f\n", PI);

    return 0;
}
