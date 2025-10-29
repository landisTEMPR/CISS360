#include <iostream>

int main()
{
    // int x = 42;
    // std::cout << ((x >> 4) & 1) << '\n';
    // double y = 3.14159;
    // std::cout << sizeof(y) << '\n';
    // std::cout << ((y >> 4) & 1) << '\n';

    float z = 3.14159;
    std::cout << sizeof(z) << '\n';

    // int * p = new int;
    // double * q = (double *) p;

    int * p = (int *) &z;
    for (int i = 31; i >= 0; --i)
    {
        std::cout << (((*p) >> i) & 1);
    }
    std::cout << '\n';

    double w = 2.718281;
    int * q = (int *) &w;
    std::cout << q[0] << ' ' << q[1] << '\n';

    for (int i = 31; i >= 0; --i)
    {
        std::cout << (((*q) >> i) & 1);
    }
    std::cout << '\n';
    for (int i = 31; i >= 0; --i)
    {
        std::cout << (((*(q + 1)) >> i) & 1);
    }
    std::cout << '\n';

    return 0;
}
