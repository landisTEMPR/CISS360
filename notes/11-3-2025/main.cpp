#include <iostream>
#include "IntArray.h"

int main()
{
    IntArray a;
    a[0] = 42;
    a[1] = -1;
    std::cout << a[0] << '\n';
    a.resize(2);
    std::cout << a << '\n';
    a.resize(1);
    std::cout << a << '\n';
    a.push_back(44);
    a.push_back(60);
    std::cout << a << '\n';

    return 0;
}
