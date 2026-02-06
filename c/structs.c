#include <stdio.h>
#include <string.h>

#define MAX_NAME_LEN 50
#define MAX_STUDENTS 5

struct Student {
    char name[MAX_NAME_LEN];
    int age;
    double gpa;
};

/* Print a student (passed by value, just reading fields) */
void print_student(struct Student s) {
    printf("Name: %s, Age: %d, GPA: %.2f\n", s.name, s.age, s.gpa);
}

/* Curve a student's GPA (passed by pointer so we can modify it) */
void curve_gpa(struct Student *s, double amount) {
    s->gpa += amount;
    if (s->gpa > 4.0) {
        s->gpa = 4.0;  // cap at 4.0
    }
}

/* Find the index of the student with the highest GPA */
int find_best_student(struct Student students[], int count) {
    if (count == 0) {
        return -1;  // no students
    }

    int best_index = 0;

    for (int i = 1; i < count; i++) {
        if (students[i].gpa > students[best_index].gpa) {
            best_index = i;
        }
    }

    return best_index;
}

int main(void) {
    /* Initialize an array of structs */
    struct Student students[MAX_STUDENTS] = {
        {"Alice",  20, 3.6},
        {"Bob",    19, 2.9},
        {"Cara",   21, 3.9},
        {"David",  22, 3.2},
        {"Eve",    20, 3.4}
    };

    int count = 5;

    printf("=== Original students ===\n");
    for (int i = 0; i < count; i++) {
        print_student(students[i]);
    }

    /* Curve everyone’s GPA by +0.2 using pointers */
    for (int i = 0; i < count; i++) {
        curve_gpa(&students[i], 0.2);
    }

    printf("\n=== After GPA curve ===\n");
    for (int i = 0; i < count; i++) {
        print_student(students[i]);
    }

    /* Find and print the best student */
    int best = find_best_student(students, count);
    if (best != -1) {
        printf("\nBest student:\n");
        print_student(students[best]);
    }

    return 0;
}
