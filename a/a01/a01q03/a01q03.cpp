// File: a01q03.cpp
// Author: Brysen Landis

#include <iostream>

int main()
{
    int x;
    x = 0;
    std::cin >> x;

    int i;
    i = 0;

  LOOP:
    if (i >= x) goto LOOP_END;

    std::cout << i << std::endl;
    i = i + 1;

    goto LOOP;

  LOOP_END:
    return 0;
}
