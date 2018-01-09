if [ "$1" == "wrong" ]; then
    echo "incorrect usage"
    gcc -c a.c
    g++ main1.cpp a.o
    # /tmp/cc4vOECA.o: In function `main':
    # main1.cpp:(.text+0x5): undefined reference to `foo()'
    # main1.cpp:(.text+0x32): undefined reference to `foo()'
    # collect2: error: ld returned 1 exit status
elif [ "$1" == "static" ]; then
    echo "static link"
    gcc -c a.c -o a.o
    ar rcs liba.a a.o
    g++ main.cpp liba.a -o main
    ./main
elif [ "$1" == "dynamic" ]; then
    echo "dynamic link"
    gcc -fPIC -c a.c -o a.o
    gcc -shared -o liba.so a.o
    g++ -L. -la -o main main.cpp
    LD_LIBRARY_PATH=. ./main
else
    echo "test mode"
    gcc -c a.c
    g++ main.cpp a.o
    ./a.out
fi
