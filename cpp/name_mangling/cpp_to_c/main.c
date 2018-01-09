#include <stdio.h>

int foo();
extern int global_a;

int main() {
    printf("%d\n", foo());
    global_a ++;
    printf("%d\n", foo());
    return 0;
}
