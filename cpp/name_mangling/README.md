### Notes

* name mangling跟源码后缀(.c或者.cpp)没关系，.c用g++编译，依然会name mangling。
* extern "C"一定是出现在C++编译单元里，才有意义，它的目的是让C++不要给包进去的函数(声明或定义)做name mangling。
* 一种情况；出现在C的头文件里，并不影响C的编译。当被C++ include进来后，就可以让C++不做name mangling了。
* 另一种情况：出现在C++的头文件里，影响C++的编译，不做name mangling。当被C include后，可以找到符号。

### Links

* [extern C](https://stackoverflow.com/questions/1041866/in-c-source-what-is-the-effect-of-extern-c)
