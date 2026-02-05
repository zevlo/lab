#include <stdio.h>

int main() {
    int x = 5, y = 10, z = 15;

    // Logical AND (&&)
    printf("Logical AND (&&) Demonstrations:\n");
    printf("(x < y) && (y < z) is %d\n", (x < y) && (y < z));
    printf("(x > y) && (y < z) is %d\n", (x > y) && (y < z));

    // Logical OR (||)
    printf("\nLogical OR (||) Demonstrations:\n");
    printf("(x > y) || (y < z) is %d\n", (x > y) || (y < z));
    printf("(x > y) || (y > z) is %d\n", (x > y) || (y > z));

    // Logical NOT (!)
    printf("\nLogical NOT (!) Demonstrations:\n");
    printf("!(x < y) is %d\n", !(x < y));
    printf("!(x > y) is %d\n", !(x > y));

    // Complex logical expressions
    printf("\nComplex Logical Expressions:\n");
    int a = 20, b = 30, c = 40;
    printf("((a < b) && (b < c)) is %d\n", ((a < b) && (b < c)));
    printf("((a > b) || (b < c)) is %d\n", ((a > b) || (b < c)));

    return 0;
}
