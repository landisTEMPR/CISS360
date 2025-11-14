#include <iostream>

int main()
{
    float f;
    unsigned int* x = (unsigned int*)(void*)(&f);
    *x = (1 << 31) // s
        | (0x7e << 23) // E + Bias
        | (1 << 21); // F
    std::cout << f << std::endl;

    return 0;
}
