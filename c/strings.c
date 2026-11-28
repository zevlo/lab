#include <stdio.h>
#include <string.h>

int main() {
    // Declaring and initializing a string (a char array ending in '\0')
    char greeting[] = "Hello";

    // Printing a string with %s
    printf("greeting = %s\n", greeting);

    // Strings end with a null terminator '\0'
    printf("Characters of greeting:\n");
    int i = 0;
    while (greeting[i] != '\0') {
        printf("greeting[%d] = '%c'\n", i, greeting[i]);
        i++;
    }
    printf("greeting[%d] = '\\0' (null terminator)\n", i);

    // String length with strlen
    printf("strlen(greeting) = %zu\n", strlen(greeting));

    // Manual length count — what strlen does internally
    int length = 0;
    while (greeting[length] != '\0') {
        length++;
    }
    printf("Manual length count = %d\n", length);

    // Reading a string from user input
    char word[50];
    printf("Enter a word: ");
    scanf("%49s", word);
    printf("You entered: %s (length %zu)\n", word, strlen(word));

    // Copying a string
    char copied[50];
    strcpy(copied, greeting);
    printf("copied = %s\n", copied);

    // Comparing strings (0 means equal)
    char other[] = "Hello";
    int result = strcmp(greeting, other);
    printf("strcmp(greeting, other) = %d (0 means equal)\n", result);

    return 0;
}
