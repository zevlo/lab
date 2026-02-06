#include <stdio.h>

int main() {
    int a = 10, b = 20, c = 10;

    // Greater than (>)
    printf("Greater than comparison:\n");
    printf("%d > %d is %d\n", a, b, a > b);
    printf("%d > %d is %d\n", b, a, b > a);

    // Less than (<)
    printf("\nLess than comparison:\n");
    printf("%d < %d is %d\n", a, b, a < b);
    printf("%d < %d is %d\n", b, a, b < a);

    // Equal to (==)
    printf("\nEqual to comparison:\n");
    printf("%d == %d is %d\n", a, b, a == b);
    printf("%d == %d is %d\n", a, c, a == c);

    // Other relational operators
    printf("\nOther comparisons:\n");
    printf("%d >= %d is %d\n", a, c, a >= c);  // Greater than or equal to
    printf("%d <= %d is %d\n", a, b, a <= b);  // Less than or equal to
    printf("%d != %d is %d\n", a, b, a != b);  // Not equal to

    return 0;
}
