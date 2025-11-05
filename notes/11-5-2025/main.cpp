/*
--------------------------------------------------------------------------------------------------------
    NOTES: BIT COMPUTATION WITH SIGNED INTS
    DATE: 11/5/2025
--------------------------------------------------------------------------------------------------------
*/

#include <iostream>

void get_bits(int b[32], unsigned int x, int base = 2)
{
    for (int i = 0; i < 32; ++i)
    {
        b[i] = x % base;
        x /= base;
    }
}


void println_bits(int x, int base = 2)
{
    char S[36];
    for (int i = 0; i < 10; ++i) S[i] = '0' + i;
    for (int i = 0; i < 26; ++i) S[10 + i] = 'A' + i;

    int b[32];
    get_bits(b, x, base);
    for (int i = 31; i >= 0; --i)
    {
        std::cout << S[b[i]] << ' ';
    }
    std::cout << '\n';
}


void toggle(int * x, int i = 0)
{
    (*x) ^= (1 << i);
}


int main()
{
    int x = 19;
    int y = 27;
    int base = 2;
    println_bits(x, base);
    println_bits(y, base);
    //println_bits(y, base);
    println_bits(~x, base);
    //std::cout << (~x) << '\n';
    println_bits(x & y, base);
    println_bits(x | y, base);
    println_bits(x ^ y, base);
    std::cout << "***\n";
    println_bits(x, 2);
    // toggle(x, 0);
    println_bits(x, 2);

    int q = -42;
    std::cout << "-1: ";
    println_bits(q);
    return 0;
 }
