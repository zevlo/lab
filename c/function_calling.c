#include <stdio.h>

// Function prototypes
int add_numbers(int a, int b);
void print_greeting(char* name);
float calculate_average(float a, float b, float c);

int main() {
    // Method 1: Direct function call and immediate printing
    printf("Addition Result: %d\n", add_numbers(5, 7));

    // Method 2: Store function return value in a variable
    int sum = add_numbers(10, 20);
    printf("Sum of 10 and 20 is: %d\n", sum);

    // Method 3: Call function with direct arguments
    print_greeting("LabEx Student");

    // Method 4: Calculate and use function return value
    float avg = calculate_average(10.5, 20.3, 30.7);
    printf("Average of numbers: %.2f\n", avg);

    return 0;
}

// Function implementation for addition
int add_numbers(int a, int b) {
    return a + b;
}

// Function implementation for greeting
void print_greeting(char* name) {
    printf("Hello, %s! Welcome to function calls.\n", name);
}

// Function implementation for average calculation
float calculate_average(float a, float b, float c) {
    return (a + b + c) / 3;
}
