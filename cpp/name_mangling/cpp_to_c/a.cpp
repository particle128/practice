extern "C" {
    int foo();
}

int global_a=0;

int foo() {
    return global_a;
}
