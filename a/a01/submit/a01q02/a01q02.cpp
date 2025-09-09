// File: a01q02.cpp
// Author: Brysen Landis

#include <iostream>

int main()
{
    int x;
    x = 0;

    std::cin >> x;

    int y = 0;
    if (x < 0) goto NEG;

    std::cout << "bar" << std::endl;
    y = 2;
    goto DONE;

  NEG:
    std::cout << "foo" << std::endl;
    y = 1;

  DONE:
    std::cout << y << std::endl;
    return 0;
}
