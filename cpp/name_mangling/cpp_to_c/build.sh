if [ "$1" == "wrong" ]; then
    echo "incorrect usage"
    g++ -c a1.cpp
    gcc main.c a1.o
    # /tmp/cc30rhuV.o: In function `main':
    # main.c:(.text+0xa): undefined reference to `foo'
    # main.c:(.text+0x34): undefined reference to `foo'
    # collect2: error: ld returned 1 exit status
elif [ "$1" == "static" ]; then
    echo "static link"
    g++ -c a.cpp -o a.o
    ar rcs liba.a a.o
    gcc main.c liba.a -o main
    ./main
elif [ "$1" == "dynamic" ]; then
    echo "dynamic link"
    g++ -fPIC -c a.cpp -o a.o
    g++ -shared -o liba.so a.o
    gcc -L. -la -o main main.c
    LD_LIBRARY_PATH=. ./main
else
    echo "test mode"
    g++ -c a.cpp
    gcc main.c a.o
    ./a.out
fi
