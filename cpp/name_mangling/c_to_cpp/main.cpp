#include <iostream>
using namespace std;
extern "C" {
int foo();
}
extern int global_a;

int main() {
    cout << foo() << endl;
    global_a ++;
    cout << foo() << endl;
    return 0;
}
